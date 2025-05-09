/* Types of tanks!
 * Contains:
 *		Oxygen
 *		Anesthetic
 *		Air
 *		Phoron
 *		Emergency Oxygen
 */

/*
 * Oxygen
 */
/obj/item/tank/oxygen
	name = "oxygen tank"
	desc = "A tank of oxygen."
	icon_state = "oxygen"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/oxygen/Initialize(mapload)
	. = ..()
	air_contents.adjust_gas(GAS_O2, (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/oxygen/examine(mob/user)
	. = ..()
	if(loc == user && (air_contents.gas[GAS_O2] < 10))
		. += span_warning("The meter on \the [src] indicates you are almost out of oxygen!")

/obj/item/tank/oxygen/yellow
	desc = "A tank of oxygen, this one is yellow."
	icon_state = "oxygen_f"

/obj/item/tank/oxygen/red
	desc = "A tank of oxygen, this one is red."
	icon_state = "oxygen_fr"

/*
 * Anesthetic
 */
/obj/item/tank/anesthetic
	name = "anesthetic tank"
	desc = "A tank with an N2O/O2 gas mix."
	icon_state = "anesthetic"

/obj/item/tank/anesthetic/Initialize(mapload)
	. = ..()

	air_contents.gas[GAS_O2] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD
	air_contents.gas[GAS_N2O] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD
	air_contents.update_values()

/*
 * Air
 */
/obj/item/tank/air
	name = "air tank"
	desc = "Mixed. Shaken, not stirred."		// CHOMP EDIT Haha funny? idk I like this description.
	icon_state = "oxygen"

/obj/item/tank/air/examine(mob/user)
	. = ..()
	if(loc == user && (air_contents.gas[GAS_O2] < 1))
		. += span_warning("The meter on \the [src] indicates you are almost out of air!")
		user << sound('sound/effects/alert.ogg')

/obj/item/tank/air/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_multi(GAS_O2, (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD, GAS_N2, (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD)

/*
 * Phoron
 */
/obj/item/tank/phoron
	name = "phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon_state = "phoron"
	gauge_icon = null
	slot_flags = null	//they have no straps!

/obj/item/tank/phoron/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_PHORON, (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/phoron/attackby(obj/item/W as obj, mob/user as mob)
	..()

	if (istype(W, /obj/item/flamethrower))
		var/obj/item/flamethrower/F = W
		if ((!F.status)||(F.ptank))
			return
		master = F
		F.ptank = src
		user.remove_from_mob(src)
		forceMove(F)
		F.update_icon()
	return

/obj/item/tank/vox	//Can't be a child of phoron or the gas amount gets screwey.
	name = "phoron tank"
	desc = "Contains dangerous phoron. Do not inhale. Warning: extremely flammable."
	icon_state = "phoron_vox"
	gauge_icon = "indicator_bigtank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	slot_flags = SLOT_BACK	//these ones have straps!

/obj/item/tank/vox/Initialize(mapload)
	. = ..()
	air_contents.adjust_gas(GAS_PHORON, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)) //VOREStation Edit

/obj/item/tank/phoron/pressurized
	name = "fuel can"
	icon_state = "phoron_vox"
	w_class = ITEMSIZE_NORMAL

/obj/item/tank/phoron/pressurized/Initialize(mapload)
	. = ..()
	adjust_scale(0.8)
	air_contents.adjust_gas(GAS_PHORON, (7*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/*
 * Emergency Oxygen
 */

/obj/item/tank/emergency
	name = "emergency tank"
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome
	gauge_cap = 4
	slot_flags = SLOT_BELT
	w_class = ITEMSIZE_SMALL
	force = 4
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 2 //Tiny. Real life equivalents only have 21 breaths of oxygen in them. They're EMERGENCY tanks anyway -errorage (dangercon 2011)

/obj/item/tank/emergency/oxygen
	name = "emergency oxygen tank"
	desc = "Used for emergencies. Contains very little oxygen, so try to conserve it until you actually need it."
	icon_state = "emergency"
	gauge_icon = "indicator_smalltank"		// CHOMP EDIT fixes indicator to ensure there's never a buggy outcome

/obj/item/tank/emergency/oxygen/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_O2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/oxygen/examine(mob/user)
	. = ..()
	if(loc == user && (air_contents.gas[GAS_O2] < 0.2))
		. += span_danger("The meter on the [src.name] indicates you are almost out of air!")
		user << sound('sound/effects/alert.ogg')

/obj/item/tank/emergency/oxygen/engi
	name = "extended-capacity emergency oxygen tank"
	icon_state = "emergency_engi"
	volume = 6

/obj/item/tank/emergency/oxygen/double
	name = "double emergency oxygen tank"
	icon_state = "emergency_double"
	gauge_icon = "indicator_double"			// CHOMP EDIT proper gauge icon
	volume = 12 					// CHOMP EDIT Double Expanded

/obj/item/tank/stasis/oxygen // Stasis bags need to have initial pressure within safe bounds for human atmospheric pressure (NOT breath pressure)
	name = "stasis oxygen tank"
	desc = "Oxygen tank included in most stasis bag designs."
	icon = 'icons/obj/tank_ch.dmi'			// CHOMP ADD Adds a unique icon to the oxygen tank in stasis bags.
	icon_state = "stasis_oxygen"			// CHOMP ADD
	gauge_icon = "indicator_stasis"			// CHOMP ADD
	volume = 10

/obj/item/tank/stasis/oxygen/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_O2, (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/nitrogen
	name = "emergency nitrogen tank"
	desc = "An emergency nitrogen tank."			// CHOMP EDIT They get their own :)
	icon_state = "emergency_nitrogen"				// :)
	gauge_icon = "indicator_smalltank"				// :)

/obj/item/tank/emergency/nitrogen/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_N2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/nitrogen/double
	name = "double emergency nitrogen tank"
	icon_state = "emergency_double_vox_old"			// CHOMP EDIT Nitrogen double gets its OWN sprite >:3c
	gauge_icon = "indicator_double"					// <3
	volume = 12			// CHOMP EDIT Double Expanded

/obj/item/tank/emergency/phoron
	name = "emergency phoron tank"
	desc = "An emergency phoron tank."  			// CHOMP EDIT You get a unique sprite!
	icon_state = "emergency_phoron_vox"				// And you get a unique sprite!
	gauge_icon = "indicator_smalltank"				// Look under your chairs! You all get unique sprites!

/obj/item/tank/emergency/phoron/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_PHORON, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/phoron/double
	name = "double emergency phoron tank"
	icon_state = "emergency_double_vox"				// CHOMP EDIT Unique sprites. :)
	gauge_icon = "indicator_double"					// Ensuring unique sprite stuff ig.
	volume = 10

//CHOMPEdit Start - for CO2 breathers
/obj/item/tank/carbon_dioxide
	name = "carbon dioxide tank"
	desc = "A tank of carbon dioxide"
	icon_state = "emergency_double"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/carbon_dioxide/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_CO2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/carbon_dioxide
	name = "emergency carbon dioxide tank"
	desc = "An emergency tank of carbon dioxide"
	icon_state = "emergency_tst"
	slot_flags = SLOT_BELT
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/emergency/carbon_dioxide/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_CO2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

/obj/item/tank/emergency/carbon_dioxide/double
	name = "double emergency carbon dioxide tank"
	desc = "An double tank of carbon dioxide"
	icon_state = "emergency_double"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/emergency/carbon_dioxide/double/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_CO2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))
//CHOMPEdit End

/*
 * Nitrogen
 */
/obj/item/tank/nitrogen
	name = "nitrogen tank"
	desc = "A tank of nitrogen."
	icon_state = "oxygen_fr"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD

/obj/item/tank/nitrogen/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas(GAS_N2, (10*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C)) //CHOMPedit

/obj/item/tank/nitrogen/examine(mob/user)
	. = ..()
	if(loc == user && (air_contents.gas[GAS_N2] < 10))
		. += span_danger("The meter on \the [src] indicates you are almost out of nitrogen!")
		//playsound(user, 'sound/effects/alert.ogg', 50, 1)

/obj/item/tank/stasis/nitro_cryo // Synthmorph bags need to have initial pressure within safe bounds for human atmospheric pressure, but low temperature to stop unwanted degredation.
	name = "stasis cryogenic nitrogen tank"
	desc = "Cryogenic Nitrogen tank included in most synthmorph bag designs."
	icon = 'icons/obj/tank_ch.dmi'		// CHOMP ADD Adds a stasis sprite unique to this icon.
	icon_state = "stasis_nitrogen"		// CHOMP ADD
	gauge_icon = "indicator_stasis"		// CHOMP ADD
	volume = 10

/obj/item/tank/stasis/nitro_cryo/Initialize(mapload)
	. = ..()
	src.air_contents.adjust_gas_temp(GAS_N2, (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*TN60C), TN60C)
