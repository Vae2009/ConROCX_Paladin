local ConROC_Paladin, ids = ...;

--General
	ids.Racial = {
		Perception = 20600,
	}
	ids.Spec = {
		Holy = 1,
		Protection = 2,
		Retribution = 3,
	}
--Holy
	ids.Holy_Ability = {
		--[[BlessingofLightRank1 = 19977, --removed from wrath
		BlessingofLightRank2 = 19978,
		BlessingofLightRank3 = 19979,--]]
		BlessingofWisdomRank1 = 19742,
		BlessingofWisdomRank2 = 19850,
		BlessingofWisdomRank3 = 19852,
		BlessingofWisdomRank4 = 19853,
		BlessingofWisdomRank5 = 19854,
		BlessingofWisdomRank6 = 25290, --wrath
		BlessingofWisdomRank7 = 27142,
		BlessingofWisdomRank8 = 48935,
		BlessingofWisdomRank9 = 48936,
		Cleanse = 4987,
		ConsecrationRank1 = 26573,
		ConsecrationRank2 = 20116,
		ConsecrationRank3 = 20922,
		ConsecrationRank4 = 20923,
		ConsecrationRank5 = 20924,
		ConsecrationRank6 = 27173, --wrath
		ConsecrationRank7 = 48818,
		ConsecrationRank8 = 48819,
		DevinePlea = 54428, --wrath
		ExorcismRank1 = 879,
		ExorcismRank2 = 5614,
		ExorcismRank3 = 5615,
		ExorcismRank4 = 10312,
		ExorcismRank5 = 10313,
		ExorcismRank6 = 10314,
		ExorcismRank7 = 27138, --wrath
		ExorcismRank8 = 48800,
		ExorcismRank9 = 48801,
		FlashofLightRank1 = 19750,
		FlashofLightRank2 = 19939,
		FlashofLightRank3 = 19940,
		FlashofLightRank4 = 19941,
		FlashofLightRank5 = 19942,
		FlashofLightRank6 = 19943,
		FlashofLightRank7 = 27137, --wrath
		FlashofLightRank8 = 48784,
		FlashofLightRank9 = 48785,
		GlyphofHolyLight = 54968, --wrath
		--GreaterBlessingofLightRank1 = 25890, --removed in wrath
		GreaterBlessingofWisdomRank1 = 25894,
		GreaterBlessingofWisdomRank2 = 25918,
		GreaterBlessingofWisdomRank3 = 27143, --wrath
		GreaterBlessingofWisdomRank4 = 48937,
		GreaterBlessingofWisdomRank5 = 48938,
		HolyLightRank1 = 635,
		HolyLightRank2 = 639,
		HolyLightRank3 = 647,
		HolyLightRank4 = 1026,
		HolyLightRank5 = 1042,
		HolyLightRank6 = 3472,
		HolyLightRank7 = 10328,
		HolyLightRank8 = 10329,
		HolyLightRank9 = 25292, --wrath
		HolyLightRank10 = 27135,
		HolyLightRank11 = 27136,
		HolyLightRank12 = 48781,
		HolyLightRank13 = 48782,
		HolyShockRank1 = 20473,
		HolyShockRank2 = 20929,
		HolyShockRank3 = 20930,
		HolyShockRank4 = 27174, --wrath
		HolyShockRank5 = 33072,
		HolyShockRank6 = 48824,
		HolyShockRank7 = 48825,
		HolyWrathRank1 = 2812,
		HolyWrathRank2 = 10318,
		HolyWrathRank3 = 27139,
		HolyWrathRank4 = 48816,
		HolyWrathRank5 = 48817,
		LayonHandsRank1 = 633,
		LayonHandsRank2 = 2800,
		LayonHandsRank3 = 10310,
		LayonHandsRank4 = 27154,
		LayonHandsRank5 = 48788,
		Purify = 1152,
		RedemptionRank1 = 7328,
		RedemptionRank2 = 10322,
		RedemptionRank3 = 10324,
		RedemptionRank4 = 20772,
		RedemptionRank5 = 20773,
		RedemptionRank6 = 48949, --wrath
		RedemptionRank7 = 48950,
		SacredShield = 53601,
		SealofLightRank1 = 20165,
		--[[SealofLightRank2 = 20347, --removed ranks in wrath
		SealofLightRank3 = 20348,
		SealofLightRank4 = 20349,--]]
		SealofRighteousnessRank0 = 20154,
		SealofRighteousnessRank1 = 21084,
		--[[SealofRighteousnessRank2 = 20287,
		SealofRighteousnessRank3 = 20288, --removed ranks in wrath
		SealofRighteousnessRank4 = 20289,
		SealofRighteousnessRank5 = 20290,
		SealofRighteousnessRank6 = 20291,
		SealofRighteousnessRank7 = 20292,
		SealofRighteousnessRank8 = 20293,--]]
		SealofWisdomRank1 = 20166,
		--[[SealofWisdomRank2 = 20356, --removed ranks in wrath
		SealofWisdomRank3 = 20357,--]]
		SenseUndead = 5502,
		--[[TurnUndeadRank1 = 2878, --replaced by Turn Evil in wrath
		TurnUndeadRank2 = 5627,
		TurnUndeadRank3 = 10326,--]]
		TurnEvil = 10326, --wrath
	}
--Protection
	ids.Prot_Ability = {
		BlessingofKings = 20217,
		BlessingofProtectionRank1 = 1022,
		BlessingofProtectionRank2 = 5599,
		BlessingofProtectionRank3 = 10278,
		BlessingofSacrificeRank1 = 6940,
		BlessingofSacrificeRank2 = 20729,
		HandofSalvation = 1038, --renamed in wrath from Blessing of Salvation -> Hand of salvation
		BlessingofSanctuaryRank1 = 20911,
		--[[BlessingofSanctuaryRank2 = 20912, --ranks removed in wrath
		BlessingofSanctuaryRank3 = 20913,
		BlessingofSanctuaryRank4 = 20914,--]]	
		DivineIntervention = 19752,
		DivineProtectionRank1 = 498,
		--DivineProtectionRank2 = 5573, --removed in wrath
		DivineShieldRank1 = 642,
		--DivineShieldRank2 = 1020, --removed in wrath
		GreaterBlessingofKings = 25898,
		--GreaterBlessingofSalvation = 25895, --removed in wrath
		GreaterBlessingofSanctuary = 25899,
		HammerofJusticeRank1 = 853,
		HammerofJusticeRank2 = 5588,
		HammerofJusticeRank3 = 5589,
		HammerofJusticeRank4 = 10308,
		HammeroftheRighteous = 53595,
		HandofFreedom = 1044,
		HolyShieldRank1 = 20925,
		HolyShieldRank2 = 20927,
		HolyShieldRank3 = 20928,
		HolyShieldRank4 = 27179, --wrath
		HolyShieldRank5 = 48951,
		HolyShieldRank6 = 48952,
		RighteousFury = 25780,
		SealofJustice = 20164,
		ShieldofRighteousnessRank1 = 53600,	--wrath
		ShieldofRighteousnessRank2 = 61411,
	}
--Retribution
	ids.Ret_Ability = {
		AvengingWrath = 31884, --wrath
		BlessingofMightRank1 = 19740,
		BlessingofMightRank2 = 19834,
		BlessingofMightRank3 = 19835,
		BlessingofMightRank4 = 19836,
		BlessingofMightRank5 = 19837,
		BlessingofMightRank6 = 19838,
		BlessingofMightRank7 = 25291, --wrath
		BlessingofMightRank8 = 27140,
		BlessingofMightRank9 = 48931,
		BlessingofMightRank10 = 48932,
		CrusaderStrike = 35395,
		DivineStorm = 53385,
		GreaterBlessingofMightRank1 = 25782,
		GreaterBlessingofMightRank2 = 25916,
		GreaterBlessingofMightRank3 = 27141, --wrath
		GreaterBlessingofMightRank4 = 48933,
		GreaterBlessingofMightRank5 = 48934,
		HammerofWrathRank1 = 24275,
		HammerofWrathRank2 = 24274,
		HammerofWrathRank3 = 24239,
		HammerofWrathRank4 = 27180, --wrath
		HammerofWrathRank5 = 48805,
		HammerofWrathRank6 = 48806,
		JudgementofJustice = 53407, --wrath
		JudgementofLight = 20271, --new name in wrath from Judgement -> Judgement of Light
		JudgementofWisdom = 53408, --wrath
		Repentance = 20066,
		--SanctityAura = 20218, --removed from wrath
		SealofCommandRank1 = 20375,
		SealofCommandRank2 = 20915,
		SealofCommandRank3 = 20918,
		SealofCommandRank4 = 20919,
		SealofCommandRank5 = 20920,
		--[[SealoftheCrusaderRank1 = 21082, --removed from wrath
		SealoftheCrusaderRank2 = 20162,
		SealoftheCrusaderRank3 = 20305,
		SealoftheCrusaderRank4 = 20306,
		SealoftheCrusaderRank5 = 20307,
		SealoftheCrusaderRank6 = 20308,--]]
		SealofVengeance = 31801,
		SealofCorruption = 348704,
	}
-- Auras
	ids.Player_Auras = {
		ConcentrationAura = 19746,
		DevotionAuraRank1 = 465,
		DevotionAuraRank2 = 10290,
		DevotionAuraRank3 = 643,
		DevotionAuraRank4 = 10291,
		DevotionAuraRank5 = 1032,
		DevotionAuraRank6 = 10292,
		DevotionAuraRank7 = 10293,
		DevotionAuraRank8 = 27149,--wrath
		DevotionAuraRank9 = 48941,
		DevotionAuraRank10 = 48942,
		FireResistanceAuraRank1 = 19891,
		FireResistanceAuraRank2 = 19899,
		FireResistanceAuraRank3 = 19900,
		FireResistanceAuraRank4 = 27153, --wrath
		FireResistanceAuraRank5 = 48947,
		FrostResistanceAuraRank1 = 19888,
		FrostResistanceAuraRank2 = 19897,
		FrostResistanceAuraRank3 = 19898,
		FrostResistanceAuraRank4 = 27152, --wrath
		FrostResistanceAuraRank5 = 48945,
		RetributionAuraRank1 = 7294,
		RetributionAuraRank2 = 10298,
		RetributionAuraRank3 = 10299,
		RetributionAuraRank4 = 10300,
		RetributionAuraRank5 = 10301,
		RetributionAuraRank6 = 27150, --wrath
		RetributionAuraRank7 = 54043,
		ShadowResistanceAuraRank1 = 19876,
		ShadowResistanceAuraRank2 = 19875,
		ShadowResistanceAuraRank3 = 19896,
		ShadowResistanceAuraRank4 = 27151, --wrath
		ShadowResistanceAuraRank5 = 48943,
	}
	ids.Player_Buff = {
		SealofCorruption = 348704,
		IncreasedBlock = 65182,
	}
	ids.Player_Debuff = {
		Forbearance = 25771,	
	}
	ids.Target_Debuff = {
		JudgementoftheCrusaderRank1 = 21183,	
		JudgementoftheCrusaderRank2 = 20188,
		JudgementoftheCrusaderRank3 = 20300,
		JudgementoftheCrusaderRank4 = 20301,
		JudgementoftheCrusaderRank5 = 20302,
		JudgementoftheCrusaderRank6 = 20303,
		JudgementofJustice = 20184,
		JudgementofLightRank1 = 20185,
		--[[JudgementofLightRank2 = 20344, -- ranks removed in wrath
		JudgementofLightRank3 = 20345,
		JudgementofLightRank4 = 20346,--]]
		JudgementofWisdomRank1 = 20186,
		--[[JudgementofWisdomRank2 = 20354, -- ranks removed in wrath
		JudgementofWisdomRank3 = 20355,--]]
	}