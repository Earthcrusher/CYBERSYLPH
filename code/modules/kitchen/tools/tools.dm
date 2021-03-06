/obj/item/material/kitchen
	icon = 'icons/obj/kitchen/inedible/tools.dmi'
	matter = list(DEFAULT_WALL_MATERIAL = 8000)
	unbreakable = 1
	force_divisor = 0.1 // 6 when wielded with hardness 60 (steel)
	w_class = 2

/obj/item/material/kitchen/New()
	..()
	pixel_x = rand(-5,5)
	pixel_y = rand(-5,5)

/obj/item/material/kitchen/whisk
	name = "whisk"
	icon_state = "whisk"
	desc = "A general purpose mixing tool."
	attack_verb = list("whisked")

/obj/item/material/kitchen/whisk/spoon
	name = "mixing spoon"
	icon_state = ""

/obj/item/material/kitchen/spatula
	name = "spatula"
	icon_state = "spatula"
	desc = "A general purpose kitchen tool."

/obj/item/material/kitchen/spatula/tongs
	name = "tongs"
	icon_state = "tongs"

/obj/item/material/kitchen/utensil
	w_class = 1
	thrown_force_divisor = 1
	attack_verb = list("attacked", "stabbed", "poked")
	sharp = 1
	edge = 1
	force_divisor = 0.1 // 6 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 when thrown with weight 20 (steel)
	var/loaded      //Descriptive string for currently loaded food object.
	var/scoop_food = 1

/obj/item/material/kitchen/utensil/New()
	..()
	if (prob(60))
		src.pixel_y = rand(0, 4)
	create_reagents(5)
	return

/obj/item/material/kitchen/utensil/attack(mob/living/human/M as mob, mob/living/human/user as mob)
	if(!istype(M))
		return ..()

	if(user.a_intent != I_HELP)
		if(user.zone_sel.selecting == BP_HEAD || user.zone_sel.selecting == O_EYES)
			if((user.disabilities & CLUMSY) && prob(50))
				M = user
			return eyestab(M,user)
		else
			return ..()

	if (reagents.total_volume > 0)
		reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
		if(M == user)
			if(!M.can_eat(loaded))
				return
			M.visible_message("<span class='notice'>\The [user] eats some [loaded] from \the [src].</span>")
		else
			user.visible_message("<span class='warning'>\The [user] begins to feed \the [M]!</span>")
			if(!(M.can_force_feed(user, loaded) && do_mob(user, M, 5 SECONDS)))
				return
			M.visible_message("<span class='notice'>\The [user] feeds some [loaded] to \the [M] with \the [src].</span>")
		playsound(M.loc,'sound/items/eatfood.ogg', rand(10,40), 1)
		overlays.Cut()
		return
	else
		user << "<span class='warning'>You don't have anything on \the [src].</span>"	//if we have help intent and no food scooped up DON'T STAB OURSELVES WITH THE FORK
		return

/obj/item/material/kitchen/utensil/fork
	name = "fork"
	desc = "It's a fork. Sure is pointy."
	icon_state = "fork"

/obj/item/material/kitchen/utensil/fork/plastic
	default_material = "plastic"

/obj/item/material/kitchen/utensil/spoon
	name = "spoon"
	desc = "It's a spoon. You can see your own upside-down face in it."
	icon_state = "spoon"
	attack_verb = list("attacked", "poked")
	edge = 0
	sharp = 0
	force_divisor = 0.25 //5 when wielded with weight 20 (steel)

/obj/item/material/kitchen/utensil/spoon/plastic
	default_material = "plastic"

/*
 * Knives
 */
/obj/item/material/kitchen/utensil/knife
	name = "knife"
	desc = "Can cut through any food."
	icon_state = "knife"
	force_divisor = 0.2 // 12 when wielded with hardness 60 (steel)
	scoop_food = 0

// Identical to the tactical knife but nowhere near as stabby.
// Kind of like the toy esword compared to the real thing.
/obj/item/material/kitchen/utensil/knife/boot
	name = "boot knife"
	desc = "A small fixed-blade knife for putting inside a boot."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	applies_material_colour = 0
	unbreakable = 1

/obj/item/material/kitchen/utensil/knife/attack(target as mob, mob/living/user as mob)
	if ((user.disabilities & CLUMSY) && prob(50))
		user << "<span class='warning'>You somehow managed to cut yourself with \the [src].</span>"
		user.take_organ_damage(20)
		return
	return ..()

/obj/item/material/kitchen/utensil/knife/plastic
	default_material = "plastic"

/*
 * Rolling Pins
 */

/obj/item/material/kitchen/rollingpin
	name = "rolling pin"
	desc = "Used to knock out the Bartender."
	icon_state = "rolling_pin"
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked") //I think the rollingpin attackby will end up ignoring this anyway.
	default_material = "wood"
	force_divisor = 0.7 // 10 when wielded with weight 15 (wood)
	thrown_force_divisor = 1 // as above

