obj/structure
	icon = 'icons/obj/structures.dmi'
	penetration_dampening = 5

obj/structure/blob_act()
	if(prob(50))
		qdel(src)

obj/structure/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				qdel(src)
				return
		if(3.0)
			return

/obj/structure/projectile_check()
	return PROJREACT_OBJS

/obj/structure/kick_act(mob/living/carbon/human/H)
	playsound(get_turf(src), 'sound/effects/grillehit.ogg', 50, 1) //Zth: I couldn't find a proper sound, please replace it

	H.visible_message("<span class='danger'>[H] kicks \the [src].</span>", "<span class='danger'>You kick \the [src].</span>")
	if(prob(70))
		H.apply_damage(rand(2,4), BRUTE, pick("r_leg", "l_leg", "r_foot", "l_foot"))
