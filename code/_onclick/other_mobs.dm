// Generic damage proc (slimes and monkeys).
/atom/proc/attack_generic(mob/user as mob)
	return 0

/*
	Humans:
	Adds an exception for gloves, to allow special glove types like the ninja ones.

	Otherwise pretty standard.
*/
/mob/living/human/UnarmedAttack(var/atom/A, var/proximity)

	if(!..())
		return

	// Special glove functions:
	// If the gloves do anything, have them return 1 to stop
	// normal attack_hand() here.
	var/obj/item/clothing/gloves/G = gloves // not typecast specifically enough in defines
	if(istype(G) && G.do_touch(A,1))
		return

	A.attack_hand(src)

/atom/proc/attack_hand(mob/user as mob)
	return

/mob/living/human/RestrainedClickOn(var/atom/A)
	return

/mob/living/human/RangedAttack(var/atom/A)
	return

/mob/living/RestrainedClickOn(var/atom/A)
	return

/*
	New Players:
	Have no reason to click on anything at all.
*/
/mob/new_player/ClickOn()
	return

/*
	Animals
*/
/mob/living/animal/UnarmedAttack(var/atom/A, var/proximity)

	if(!..())
		return

	if(melee_damage_upper == 0 && istype(A,/mob/living))
		custom_emote(1,"[friendly_interaction] \the [A]!")
		var/mob/living/animal/critter = A
		if(istype(critter) && critter.mob_ai)
			critter.mob_ai.receive_friendly_interaction(src)
		return

	var/damage = rand(melee_damage_lower, melee_damage_upper)
	if(A.attack_generic(src,damage,attacktext,environment_smash) && loc && attack_sound)
		playsound(loc, attack_sound, 50, 1, 1)
