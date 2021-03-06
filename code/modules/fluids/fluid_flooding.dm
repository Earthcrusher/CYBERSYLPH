/turf/proc/make_flooded()
	if(!flooded)
		flooded = 1
		for(var/obj/effect/fluid/F in src)
			qdel(F)
		update_icon()

/turf/proc/flood_neighbors(var/dry_run)
	var/flooded_a_neighbor
	for(var/spread_dir in cardinal)
		if(get_fluid_blocking_dirs() & spread_dir)
			continue
		var/turf/T = get_step(src, spread_dir)
		if(!istype(T) || T.flooded || (T.get_fluid_blocking_dirs() & reverse_dir[spread_dir]) || !T.CanFluidPass(spread_dir))
			continue
		var/obj/effect/fluid/F = locate() in T
		if(!F && !dry_run)
			F = PoolOrNew(/obj/effect/fluid, T)
		if(F)
			if(F.fluid_amount >= FLUID_MAX_DEPTH)
				continue
			if(!dry_run)
				F.set_depth(FLUID_MAX_DEPTH)

		flooded_a_neighbor = 1

	if(!flooded_a_neighbor)
		fluid_master.remove_active_source(src)

	return flooded_a_neighbor

/atom/is_flooded(var/lying_mob, var/absolute)
	..()
	var/turf/T = get_turf(src)
	return T.is_flooded(lying_mob)

/turf/is_flooded(var/lying_mob, var/absolute)
	if(flooded)
		return 1
	if(!absolute)
		var/depth = get_fluid_depth()
		if(depth && depth > (lying_mob ? FLUID_SHALLOW : FLUID_DEEP))
			return 1
	return 0