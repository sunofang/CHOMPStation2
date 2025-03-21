/datum/design/circuit/algae_farm
	name = "Algae Oxygen Generator"
	id = "algae_farm"
	req_tech = list(TECH_ENGINEERING = 3, TECH_BIO = 2)
	build_path = /obj/item/circuitboard/algae_farm
	sort_string = "HABAE"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd

/datum/design/circuit/thermoregulator
	name = "thermal regulator"
	id = "thermoregulator"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 3)
	build_path = /obj/item/circuitboard/thermoregulator
	sort_string = "HABAF"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd

/datum/design/circuit/bomb_tester
	name = "Explosive Effect Simulator"
	id = "bomb_tester"
	req_tech = list(TECH_PHORON = 3, TECH_DATA = 2, TECH_MAGNET = 2)
	build_path = /obj/item/circuitboard/bomb_tester
	sort_string = "HABAG"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/quantum_pad
	name = "Quantum Pad"
	id = "quantum_pad"
	req_tech = list(TECH_ENGINEERING = 4, TECH_POWER = 4, TECH_BLUESPACE = 4)
	build_path = /obj/item/circuitboard/quantumpad
	sort_string = "HABAH"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

//////Micro mech stuff
/* //CHOMPedit commented micromech stuff, because fuck this trash
/datum/design/circuit/mecha/gopher_main
	name = "'Gopher' central control"
	id = "gopher_main"
	build_path = /obj/item/circuitboard/mecha/gopher/main
	sort_string = "NAAEA"

/datum/design/circuit/mecha/gopher_peri
	name = "'Gopher' peripherals control"
	id = "gopher_peri"
	build_path = /obj/item/circuitboard/mecha/gopher/peripherals
	sort_string = "NAAEB"

/datum/design/circuit/mecha/polecat_main
	name = "'Polecat' central control"
	id = "polecat_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/polecat/main
	sort_string = "NAAFA"

/datum/design/circuit/mecha/polecat_peri
	name = "'Polecat' peripherals control"
	id = "polecat_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/polecat/peripherals
	sort_string = "NAAFB"

/datum/design/circuit/mecha/polecat_targ
	name = "'Polecat' weapon control and targeting"
	id = "polecat_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/mecha/polecat/targeting
	sort_string = "NAAFC"

/datum/design/circuit/mecha/weasel_main
	name = "'Weasel' central control"
	id = "weasel_main"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/weasel/main
	sort_string = "NAAGA"

/datum/design/circuit/mecha/weasel_peri
	name = "'Weasel' peripherals control"
	id = "weasel_peri"
	req_tech = list(TECH_DATA = 4)
	build_path = /obj/item/circuitboard/mecha/weasel/peripherals
	sort_string = "NAAGB"

/datum/design/circuit/mecha/weasel_targ
	name = "'Weasel' weapon control and targeting"
	id = "weasel_targ"
	req_tech = list(TECH_DATA = 4, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/mecha/weasel/targeting
	sort_string = "NAAGC" */

/datum/design/circuit/transhuman_clonepod
	name = "grower pod"
	id = "transhuman_clonepod"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 3)
	build_path = /obj/item/circuitboard/transhuman_clonepod
	sort_string = "HAADA"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/transhuman_synthprinter
	name = "SynthFab 3000"
	id = "transhuman_synthprinter"
	req_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3)
	build_path = /obj/item/circuitboard/transhuman_synthprinter
	sort_string = "HAADB"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/transhuman_resleever
	name = "Resleeving pod"
	id = "transhuman_resleever"
	req_tech = list(TECH_ENGINEERING = 4, TECH_BIO = 4)
	build_path = /obj/item/circuitboard/transhuman_resleever
	sort_string = "HAADC"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

// Resleeving

/datum/design/circuit/resleeving_control
	name = "Resleeving control console"
	id = "resleeving_control"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/circuitboard/resleeving_control
	sort_string = "HAADE"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/body_designer
	name = "Body design console"
	id = "body_designer"
	req_tech = list(TECH_DATA = 5)
	build_path = /obj/item/circuitboard/body_designer
	sort_string = "HAADF"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/partslathe
	name = "Parts lathe"
	id = "partslathe"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/circuitboard/partslathe
	sort_string = "HABAD"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

// Telesci stuff

/datum/design/circuit/telesci_console
	name = "Telepad Control Console"
	id = "telesci_console"
	req_tech = list(TECH_DATA = 3, TECH_BLUESPACE = 3, TECH_PHORON = 4)
	build_path = /obj/item/circuitboard/telesci_console
	sort_string = "HAAEA"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/telesci_pad
	name = "Telepad"
	id = "telesci_pad"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_PHORON = 4, TECH_BLUESPACE = 5)
	build_path = /obj/item/circuitboard/telesci_pad
	sort_string = "HAAEB"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/quantum_pad
	name = "Quantum Pad"
	id = "quantum_pad"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 4, TECH_PHORON = 4, TECH_BLUESPACE = 5)
	build_path = /obj/item/circuitboard/quantumpad
	sort_string = "HAAC"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/rtg
	name = "radioisotope TEG"
	id = "rtg"
	req_tech = list(TECH_DATA = 3, TECH_POWER = 3, TECH_PHORON = 3, TECH_ENGINEERING = 3)
	build_path = /obj/item/circuitboard/machine/rtg
	sort_string = "HAAD"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd

/datum/design/circuit/rtg_advanced
	name = "advanced radioisotope TEG"
	id = "adv_rtg"
	req_tech = list(TECH_DATA = 5, TECH_POWER = 5, TECH_PHORON = 5, TECH_ENGINEERING = 5)
	build_path = /obj/item/circuitboard/machine/rtg/advanced
	sort_string = "HAAE"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd

/datum/design/circuit/rtg
	name = "vitals monitor"
	id = "vitals"
	req_tech = list(TECH_DATA = 3, TECH_BIO = 4, TECH_ENGINEERING = 2)
	build_path = /obj/item/circuitboard/machine/vitals_monitor
	sort_string = "HAAF"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/firework_launcher
	name = "firework launcher"
	id = "fireworklauncher"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 2)
	build_path = /obj/item/circuitboard/firework_launcher
	sort_string = "KBAAB"
	department = LATHE_ALL | LATHE_SCIENCE // CHOMPAdd

/datum/design/circuit/pointdefense
	name = "point defense battery"
	id = "pointdefense"
	req_tech = list(TECH_DATA = 2, TECH_ENGINEERING = 3, TECH_COMBAT = 4)
	build_path = /obj/item/circuitboard/pointdefense
	sort_string = "OAABA"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd

/datum/design/circuit/pointdefense_control
	name = "point defense control"
	id = "pointdefense_control"
	req_tech = list(TECH_DATA = 4, TECH_ENGINEERING = 3, TECH_COMBAT = 2)
	build_path = /obj/item/circuitboard/pointdefense_control
	sort_string = "OAABB"
	department = LATHE_ALL | LATHE_ENGINEERING // CHOMPAdd
