/proc/create_new_xenomorph(var/alien_caste,var/target)

	target = get_turf(target)
	if(!target || !alien_caste) return

	var/mob/living/carbon/human/new_alien = new(target)
	new_alien.set_species("Xenomorph [alien_caste]")
	return new_alien

/mob/living/carbon/human/xdrone/Initialize(mapload)
	h_style = "Bald"
	faction = FACTION_XENO
	. = ..(mapload, SPECIES_XENO_DRONE)

/mob/living/carbon/human/xsentinel/Initialize(mapload)
	h_style = "Bald"
	faction = FACTION_XENO
	. = ..(mapload, SPECIES_XENO_SENTINEL)

/mob/living/carbon/human/xhunter/Initialize(mapload)
	h_style = "Bald"
	faction = FACTION_XENO
	. = ..(mapload, SPECIES_XENO_HUNTER)

/mob/living/carbon/human/xqueen/Initialize(mapload)
	h_style = "Bald"
	faction = FACTION_XENO
	. = ..(mapload, SPECIES_XENO_QUEEN)

//Removed AddInfectionImages, no longer required.
