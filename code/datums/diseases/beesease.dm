/datum/disease/beesease
	name = "Beesease"
	medical_name = "Apidaemia"
	form = "Infection"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_FLUIDS | DISEASE_SPREAD_CONTACT
	cure_text = REAGENT_SUGAR
	cures = list(REAGENT_ID_SUGAR)
	agent = "Apidae Infection"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/human/monkey)
	desc = "If left untreated, subject will regurgitate bees."
	danger = DISEASE_MEDIUM

/datum/disease/beesease/stage_act()
	..()
	switch(stage)
		if(2)
			if(prob(2))
				to_chat(affected_mob, span_notice("You tastey hone in your mouth."))
		if(3)
			if(prob(10))
				to_chat(affected_mob, span_notice("Your stomach rumbles"))
			if(prob(2))
				to_chat(affected_mob, span_notice("Your stomach stings painfully."))
				if(prob(20))
					affected_mob.adjustToxLoss(2)
		if(4)
			if(prob(10))
				affected_mob.visible_message(span_danger("[affected_mob] buzzles loudly"), span_userdanger("Your stomach buzzles violently!"))
			if(prob(5))
				to_chat(affected_mob, span_danger("You feel something moving in your throat."))
			if(prob(1))
				affected_mob.visible_message(span_danger("[affected_mob] coughs up a swarm of bees!"), span_userdanger("You cough up a swarm of bees!"))
				new /mob/living/simple_mob/vore/bee(affected_mob.loc)
	return
