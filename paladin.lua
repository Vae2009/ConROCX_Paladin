local printTalentsMode = false

-- Slash command for printing talent tree with talent names and ID numbers
SLASH_CONROCPRINTTALENTS1 = "/ConROCPT"
SlashCmdList["CONROCPRINTTALENTS"] = function()
    printTalentsMode = not printTalentsMode
    ConROC:PopulateTalentIDs()
end

ConROC.Paladin = {};

local ConROC_Paladin, ids = ...;
local optionMaxIds = ...;
local currentSpecName

local consecEXP = 0;

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Paladin.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustCasted(spellID);
end

function ConROC:PopulateTalentIDs()
    local numTabs = GetNumTalentTabs()
    
    for tabIndex = 1, numTabs do
        local tabName = GetTalentTabInfo(tabIndex) .. "_Talent"
        tabName = string.gsub(tabName, "%s", "") -- Remove spaces from tab name
        if printTalentsMode then
        	print(tabName..": ")
        else
        	ids[tabName] = {}
    	end
        
        local numTalents = GetNumTalents(tabIndex)

        for talentIndex = 1, numTalents do
            local name, _, _, _, _ = GetTalentInfo(tabIndex, talentIndex)

            if name then
                local talentID = string.gsub(name, "%s", "") -- Remove spaces from talent name
                if printTalentsMode then
                	print(talentID .." = ID no: ", talentIndex)
                else
                	ids[tabName][talentID] = talentIndex
                end
            end
        end
    end
    if printTalentsMode then printTalentsMode = false end
end
ConROC:PopulateTalentIDs()

local Racial, Spec, Holy_Ability, Holy_Talent, Prot_Ability, Prot_Talent, Ret_Ability, Ret_Talent, Player_Buff, Player_Debuff, Target_Debuff, Player_Auras = ids.Racial, ids.Spec, ids.Holy_Ability, ids.Holy_Talent, ids.Prot_Ability, ids.Protection_Talent, ids.Ret_Ability, ids.Retribution_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff, ids.Player_Auras;

function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end
ConROC:SpecUpdate()
--Ranks
	local _autoAttack = 6603;
	--Holy
	--local _BlessingofLight = Holy_Ability.BlessingofLightRank1;
	local _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank1;
	local _Consecration = Holy_Ability.ConsecrationRank1;
	local _DevinePlea = Holy_Ability.DevinePlea; --wrath
	local _Exorcism = Holy_Ability.ExorcismRank1;
	local _FlashofLight = Holy_Ability.FlashofLightRank1;
	local _GlyphofHolyLight = Holy_Ability.GlyphofHolyLight; --wrath
	local _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank1;
	local _HolyLight = Holy_Ability.HolyLightRank1;
	local _HolyShock = Holy_Ability.HolyShockRank1;	
	local _HolyWrath = Holy_Ability.HolyWrathRank1;
	local _LayonHands = Holy_Ability.LayonHandsRank1;
	local _Redemption = Holy_Ability.RedemptionRank1;
	local _SacredShield = Holy_Ability.SacredShield; --wrath
	local _SealofLight = Holy_Ability.SealofLightRank1;	
	local _SealofRighteousness = Holy_Ability.SealofRighteousnessRank0;
	local _SealofWisdom = Holy_Ability.SealofWisdomRank1;
	local _TurnEvil = Holy_Ability.TurnEvil; --replaced TurnUndead in wrath

	--Protection
	local _BlessingofKings = Prot_Ability.BlessingofKings;
	local _BlessingofProtection = Prot_Ability.BlessingofProtectionRank1;
	local _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank1;
	local _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank1;
	local _DivineProtection = Prot_Ability.DivineProtectionRank1;	
	local _DivineShield = Prot_Ability.DivineShieldRank1;
	local _GreaterBlessingofKings = Prot_Ability.GreaterBlessingofKings;
	local _GreaterBlessingofSanctuary = Prot_Ability.GreaterBlessingofSanctuary;
	local _HammerofJustice = Prot_Ability.HammerofJusticeRank1;
	local _HammeroftheRighteous = Prot_Ability.HammeroftheRighteous;
	local _HandofSalvation = Prot_Ability.HandofSalvation; --renamed in wrath from Blessing of Salvation -> Hand of salvation
	local _HolyShield = Prot_Ability.HolyShieldRank1;
	local _RighteousFury = Prot_Ability.RighteousFury;
	local _SealofJustice = Prot_Ability.SealofJustice;
	local _ShieldofRighteousness = Prot_Ability.ShieldofRighteousnessRank1;

	--Retribution
	local _AvengingWrath = Ret_Ability.AvengingWrath;
	local _BlessingofMight = Ret_Ability.BlessingofMightRank1;
	local _CrusaderStrike = Ret_Ability.CrusaderStrike;
	local _DivineStorm = Ret_Ability.DivineStorm;
	local _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank1;
	local _HammerofWrath = Ret_Ability.HammerofWrathRank1;
	local _SealofCommand = Ret_Ability.SealofCommandRank1;
	local _SealofCorruption = Ret_Ability.SealofCorruption;
	--local _SealofVengeance = Ret_Ability.SealofVengeance; --use same as hords
	--local _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank1;
	local _JudgementoftheCrusader = Ret_Ability.JudgementoftheCrusaderRank1;
	local _JudgementofJustice = Ret_Ability.JudgementofJustice
	local _JudgementofLight = Ret_Ability.JudgementofLight;
	local _JudgementofWisdom = Ret_Ability.JudgementofWisdom;
	local _JudgementoftheCrusaderDEBUFF = Target_Debuff.JudgementoftheCrusaderRank1;
	local _JudgementofJusticeDEBUFF = Target_Debuff.JudgementofJustice
	local _JudgementofLightDEBUFF = Target_Debuff.JudgementofLightRank1;
	local _JudgementofWisdomDEBUFF = Target_Debuff.JudgementofWisdomRank1;

--Auras
	--Holy
	local _ConcentrationAura = Player_Auras.ConcentrationAura;

	--Protection
	local _DevotionAura = Player_Auras.DevotionAuraRank1;
	local _FireResistanceAura = Player_Auras.FireResistanceAuraRank1;
	local _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank1;	
	local _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank1;

	--Retribution
	local _RetributionAura = Player_Auras.RetributionAuraRank1;	

function ConROC:UpdateSpellID()
--Holy
--[[ --removed from wrath
if IsSpellKnown(Holy_Ability.BlessingofLightRank3) then _BlessingofLight = Holy_Ability.BlessingofLightRank3;	
elseif IsSpellKnown(Holy_Ability.BlessingofLightRank2) then _BlessingofLight = Holy_Ability.BlessingofLightRank2; end
--]]
if IsSpellKnown(Holy_Ability.BlessingofWisdomRank9) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank9;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank8) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank8;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank7) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank7;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank6) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank6;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank5) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank5;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank4) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank4;
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank3) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank3;	
elseif IsSpellKnown(Holy_Ability.BlessingofWisdomRank2) then _BlessingofWisdom = Holy_Ability.BlessingofWisdomRank2; end

if IsSpellKnown(Holy_Ability.ConsecrationRank8) then _Consecration = Holy_Ability.ConsecrationRank8;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank7) then _Consecration = Holy_Ability.ConsecrationRank7;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank6) then _Consecration = Holy_Ability.ConsecrationRank6;	
elseif IsSpellKnown(Holy_Ability.ConsecrationRank5) then _Consecration = Holy_Ability.ConsecrationRank5;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank4) then _Consecration = Holy_Ability.ConsecrationRank4;
elseif IsSpellKnown(Holy_Ability.ConsecrationRank3) then _Consecration = Holy_Ability.ConsecrationRank3;	
elseif IsSpellKnown(Holy_Ability.ConsecrationRank2) then _Consecration = Holy_Ability.ConsecrationRank2; end

if IsSpellKnown(Holy_Ability.ExorcismRank9) then _Exorcism = Holy_Ability.ExorcismRank9;
elseif IsSpellKnown(Holy_Ability.ExorcismRank8) then _Exorcism = Holy_Ability.ExorcismRank8;
elseif IsSpellKnown(Holy_Ability.ExorcismRank7) then _Exorcism = Holy_Ability.ExorcismRank7;
elseif IsSpellKnown(Holy_Ability.ExorcismRank6) then _Exorcism = Holy_Ability.ExorcismRank6;
elseif IsSpellKnown(Holy_Ability.ExorcismRank5) then _Exorcism = Holy_Ability.ExorcismRank5;
elseif IsSpellKnown(Holy_Ability.ExorcismRank4) then _Exorcism = Holy_Ability.ExorcismRank4;
elseif IsSpellKnown(Holy_Ability.ExorcismRank3) then _Exorcism = Holy_Ability.ExorcismRank3;
elseif IsSpellKnown(Holy_Ability.ExorcismRank2) then _Exorcism = Holy_Ability.ExorcismRank2; end

if IsSpellKnown(Holy_Ability.FlashofLightRank9) then _FlashofLight = Holy_Ability.FlashofLightRank9;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank8) then _FlashofLight = Holy_Ability.FlashofLightRank8;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank7) then _FlashofLight = Holy_Ability.FlashofLightRank7;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank6) then _FlashofLight = Holy_Ability.FlashofLightRank6;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank5) then _FlashofLight = Holy_Ability.FlashofLightRank5;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank4) then _FlashofLight = Holy_Ability.FlashofLightRank4;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank3) then _FlashofLight = Holy_Ability.FlashofLightRank3;
elseif IsSpellKnown(Holy_Ability.FlashofLightRank2) then _FlashofLight = Holy_Ability.FlashofLightRank2; end	

if IsSpellKnown(Holy_Ability.GreaterBlessingofWisdomRank5) then _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank5;
elseif IsSpellKnown(Holy_Ability.GreaterBlessingofWisdomRank4) then _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank4;
elseif IsSpellKnown(Holy_Ability.GreaterBlessingofWisdomRank3) then _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank3;	
elseif IsSpellKnown(Holy_Ability.GreaterBlessingofWisdomRank2) then _GreaterBlessingofWisdom = Holy_Ability.GreaterBlessingofWisdomRank2; end

if IsSpellKnown(Holy_Ability.HolyLightRank13) then _HolyLight = Holy_Ability.HolyLightRank13;
elseif IsSpellKnown(Holy_Ability.HolyLightRank12) then _HolyLight = Holy_Ability.HolyLightRank12;
elseif IsSpellKnown(Holy_Ability.HolyLightRank11) then _HolyLight = Holy_Ability.HolyLightRank11;
elseif IsSpellKnown(Holy_Ability.HolyLightRank10) then _HolyLight = Holy_Ability.HolyLightRank10;
elseif IsSpellKnown(Holy_Ability.HolyLightRank9) then _HolyLight = Holy_Ability.HolyLightRank9;
elseif IsSpellKnown(Holy_Ability.HolyLightRank8) then _HolyLight = Holy_Ability.HolyLightRank8;
elseif IsSpellKnown(Holy_Ability.HolyLightRank7) then _HolyLight = Holy_Ability.HolyLightRank7;
elseif IsSpellKnown(Holy_Ability.HolyLightRank6) then _HolyLight = Holy_Ability.HolyLightRank6;
elseif IsSpellKnown(Holy_Ability.HolyLightRank5) then _HolyLight = Holy_Ability.HolyLightRank5;
elseif IsSpellKnown(Holy_Ability.HolyLightRank4) then _HolyLight = Holy_Ability.HolyLightRank4;
elseif IsSpellKnown(Holy_Ability.HolyLightRank3) then _HolyLight = Holy_Ability.HolyLightRank3;
elseif IsSpellKnown(Holy_Ability.HolyLightRank2) then _HolyLight = Holy_Ability.HolyLightRank2; end

if IsSpellKnown(Holy_Ability.HolyShockRank7) then _HolyShock = Holy_Ability.HolyShockRank7;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank6) then _HolyShock = Holy_Ability.HolyShockRank6;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank5) then _HolyShock = Holy_Ability.HolyShockRank5;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank4) then _HolyShock = Holy_Ability.HolyShockRank4;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank3) then _HolyShock = Holy_Ability.HolyShockRank3;	
elseif IsSpellKnown(Holy_Ability.HolyShockRank2) then _HolyShock = Holy_Ability.HolyShockRank2; end	

if IsSpellKnown(Holy_Ability.HolyWrathRank5) then _HolyWrath = Holy_Ability.HolyWrathRank5;
elseif IsSpellKnown(Holy_Ability.HolyWrathRank4) then _HolyWrath = Holy_Ability.HolyWrathRank4;
elseif IsSpellKnown(Holy_Ability.HolyWrathRank3) then _HolyWrath = Holy_Ability.HolyWrathRank3;
elseif IsSpellKnown(Holy_Ability.HolyWrathRank2) then _HolyWrath = Holy_Ability.HolyWrathRank2; end

--[[ removed ranks in wrath
if IsSpellKnown(Holy_Ability.SealofLightRank4) then _SealofLight = Holy_Ability.SealofLightRank4; _JudgementofLight = Target_Debuff.JudgementofLightRank4;
elseif IsSpellKnown(Holy_Ability.SealofLightRank3) then _SealofLight = Holy_Ability.SealofLightRank3; _JudgementofLight = Target_Debuff.JudgementofLightRank3;
elseif IsSpellKnown(Holy_Ability.SealofLightRank2) then _SealofLight = Holy_Ability.SealofLightRank2; _JudgementofLight = Target_Debuff.JudgementofLightRank2; end
--]]

--[[ removed ranks in wrath
if IsSpellKnown(Holy_Ability.SealofRighteousnessRank8) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank8;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank7) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank7;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank6) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank6;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank5) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank5;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank4) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank4;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank3) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank3;
elseif IsSpellKnown(Holy_Ability.SealofRighteousnessRank2) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank2;
else--]]
if IsSpellKnown(Holy_Ability.SealofRighteousnessRank1) then _SealofRighteousness = Holy_Ability.SealofRighteousnessRank1; end

--[[ removed ranks in wrath
if IsSpellKnown(Holy_Ability.SealofWisdomRank3) then _SealofWisdom = Holy_Ability.SealofWisdomRank3; _JudgementofWisdom = Target_Debuff.JudgementofWisdomRank3;
elseif IsSpellKnown(Holy_Ability.SealofWisdomRank2) then _SealofWisdom = Holy_Ability.SealofWisdomRank2; _JudgementofWisdom = Target_Debuff.JudgementofWisdomRank2; end
--]]

--Protection
if IsSpellKnown(Prot_Ability.BlessingofProtectionRank3) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank3;	
elseif IsSpellKnown(Prot_Ability.BlessingofProtectionRank2) then _BlessingofProtection = Prot_Ability.BlessingofProtectionRank2; end

if IsSpellKnown(Prot_Ability.BlessingofSacrificeRank2) then _BlessingofSacrifice = Prot_Ability.BlessingofSacrificeRank2; end

--[[ removed ranks in wrath
if IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank4) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank4;
elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank3) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank3;	
elseif IsSpellKnown(Prot_Ability.BlessingofSanctuaryRank2) then _BlessingofSanctuary = Prot_Ability.BlessingofSanctuaryRank2; end
--]]

--removed in wrath
--if IsSpellKnown(Prot_Ability.DivineProtectionRank2) then _DivineProtection = Prot_Ability.DivineProtectionRank2; end

--removed in wrath
--if IsSpellKnown(Prot_Ability.DivineShieldRank2) then _DivineShield = Prot_Ability.DivineShieldRank2; end

if IsSpellKnown(Prot_Ability.HammerofJusticeRank4) then _HammerofJustice = Prot_Ability.HammerofJusticeRank4;
elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank3) then _HammerofJustice = Prot_Ability.HammerofJusticeRank3;
elseif IsSpellKnown(Prot_Ability.HammerofJusticeRank2) then _HammerofJustice = Prot_Ability.HammerofJusticeRank2; end

if IsSpellKnown(Prot_Ability.HolyShieldRank6) then _HolyShield = Prot_Ability.HolyShieldRank6;	
elseif IsSpellKnown(Prot_Ability.HolyShieldRank5) then _HolyShield = Prot_Ability.HolyShieldRank5;	
elseif IsSpellKnown(Prot_Ability.HolyShieldRank4) then _HolyShield = Prot_Ability.HolyShieldRank4;	
elseif IsSpellKnown(Prot_Ability.HolyShieldRank3) then _HolyShield = Prot_Ability.HolyShieldRank3;	
elseif IsSpellKnown(Prot_Ability.HolyShieldRank2) then _HolyShield = Prot_Ability.HolyShieldRank2; end

if IsSpellKnown(Prot_Ability.ShieldofRighteousnessRank2) then _ShieldofRighteousness = Prot_Ability.ShieldofRighteousnessRank2; end


--Retribution
if IsSpellKnown(Ret_Ability.BlessingofMightRank10) then _BlessingofMight = Ret_Ability.BlessingofMightRank10;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank9) then _BlessingofMight = Ret_Ability.BlessingofMightRank9;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank8) then _BlessingofMight = Ret_Ability.BlessingofMightRank8;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank7) then _BlessingofMight = Ret_Ability.BlessingofMightRank7;	
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank6) then _BlessingofMight = Ret_Ability.BlessingofMightRank6;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank5) then _BlessingofMight = Ret_Ability.BlessingofMightRank5;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank4) then _BlessingofMight = Ret_Ability.BlessingofMightRank4;
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank3) then _BlessingofMight = Ret_Ability.BlessingofMightRank3;	
elseif IsSpellKnown(Ret_Ability.BlessingofMightRank2) then _BlessingofMight = Ret_Ability.BlessingofMightRank2; end

if IsSpellKnown(Ret_Ability.GreaterBlessingofMightRank5) then _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank5;
elseif IsSpellKnown(Ret_Ability.GreaterBlessingofMightRank4) then _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank4;
elseif IsSpellKnown(Ret_Ability.GreaterBlessingofMightRank3) then _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank3;	
elseif IsSpellKnown(Ret_Ability.GreaterBlessingofMightRank2) then _GreaterBlessingofMight = Ret_Ability.GreaterBlessingofMightRank2; end

if IsSpellKnown(Ret_Ability.HammerofWrathRank6) then _HammerofWrath = Ret_Ability.HammerofWrathRank6;
elseif IsSpellKnown(Ret_Ability.HammerofWrathRank5) then _HammerofWrath = Ret_Ability.HammerofWrathRank5;
elseif IsSpellKnown(Ret_Ability.HammerofWrathRank4) then _HammerofWrath = Ret_Ability.HammerofWrathRank4;
elseif IsSpellKnown(Ret_Ability.HammerofWrathRank3) then _HammerofWrath = Ret_Ability.HammerofWrathRank3;
elseif IsSpellKnown(Ret_Ability.HammerofWrathRank2) then _HammerofWrath = Ret_Ability.HammerofWrathRank2; end

if IsSpellKnown(Ret_Ability.SealofCommandRank5) then _SealofCommand = Ret_Ability.SealofCommandRank5;
elseif IsSpellKnown(Ret_Ability.SealofCommandRank4) then _SealofCommand = Ret_Ability.SealofCommandRank4;
elseif IsSpellKnown(Ret_Ability.SealofCommandRank3) then _SealofCommand = Ret_Ability.SealofCommandRank3;	
elseif IsSpellKnown(Ret_Ability.SealofCommandRank2) then _SealofCommand = Ret_Ability.SealofCommandRank2; end

if IsSpellKnown(Ret_Ability.SealofVengeance) then _SealofCorruption = Ret_Ability.SealofVengeance; end

--[[ --removed from wrath
if IsSpellKnown(Ret_Ability.SealoftheCrusaderRank6) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank6; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank6;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank5) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank5; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank5;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank4) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank4; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank4;
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank3) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank3; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank3;	
elseif IsSpellKnown(Ret_Ability.SealoftheCrusaderRank2) then _SealoftheCrusader = Ret_Ability.SealoftheCrusaderRank2; _JudgementoftheCrusader = Target_Debuff.JudgementoftheCrusaderRank2; end
--]]
--Auras
--Holy
--Protection
if IsSpellKnown(Player_Auras.DevotionAuraRank10) then _DevotionAura = Player_Auras.DevotionAuraRank10;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank9) then _DevotionAura = Player_Auras.DevotionAuraRank9;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank8) then _DevotionAura = Player_Auras.DevotionAuraRank8;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank7) then _DevotionAura = Player_Auras.DevotionAuraRank7;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank6) then _DevotionAura = Player_Auras.DevotionAuraRank6;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank5) then _DevotionAura = Player_Auras.DevotionAuraRank5;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank4) then _DevotionAura = Player_Auras.DevotionAuraRank4;
elseif IsSpellKnown(Player_Auras.DevotionAuraRank3) then _DevotionAura = Player_Auras.DevotionAuraRank3;	
elseif IsSpellKnown(Player_Auras.DevotionAuraRank2) then _DevotionAura = Player_Auras.DevotionAuraRank2; end

if IsSpellKnown(Player_Auras.FireResistanceAuraRank5) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank5;
elseif IsSpellKnown(Player_Auras.FireResistanceAuraRank4) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank4;
elseif IsSpellKnown(Player_Auras.FireResistanceAuraRank3) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank3;
elseif IsSpellKnown(Player_Auras.FireResistanceAuraRank2) then _FireResistanceAura = Player_Auras.FireResistanceAuraRank2; end

if IsSpellKnown(Player_Auras.FrostResistanceAuraRank3) then _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank3;	
elseif IsSpellKnown(Player_Auras.FrostResistanceAuraRank2) then _FrostResistanceAura = Player_Auras.FrostResistanceAuraRank2; end

if IsSpellKnown(Player_Auras.ShadowResistanceAuraRank5) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank5;	
elseif IsSpellKnown(Player_Auras.ShadowResistanceAuraRank4) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank4;	
elseif IsSpellKnown(Player_Auras.ShadowResistanceAuraRank3) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank3;	
elseif IsSpellKnown(Player_Auras.ShadowResistanceAuraRank2) then _ShadowResistanceAura = Player_Auras.ShadowResistanceAuraRank2; end	

--Retribution
if IsSpellKnown(Player_Auras.RetributionAuraRank7) then _RetributionAura = Player_Auras.RetributionAuraRank7;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank6) then _RetributionAura = Player_Auras.RetributionAuraRank6;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank5) then _RetributionAura = Player_Auras.RetributionAuraRank5;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank4) then _RetributionAura = Player_Auras.RetributionAuraRank4;
elseif IsSpellKnown(Player_Auras.RetributionAuraRank3) then _RetributionAura = Player_Auras.RetributionAuraRank3;	
elseif IsSpellKnown(Player_Auras.RetributionAuraRank2) then _RetributionAura = Player_Auras.RetributionAuraRank2; end	


ids.optionMaxIds = {
	--Holy
	--BlessingofLight = _BlessingofLight,
	BlessingofWisdom = _BlessingofWisdom,
	Consecration = _Consecration,
	Exorcism = _Exorcism,
	FlashofLight = _FlashofLight,
	GreaterBlessingofWisdom = _GreaterBlessingofWisdom,
	HammerofWrath = _HammerofWrath,
	HolyLight = _HolyLight,
	HolyShock = _HolyShock,
	HolyWrath = _HolyWrath,
	LayonHands = _LayonHands,
	Redemption = _Redemption,
	SealofLight = _SealofLight,
	SealofRighteousness = _SealofRighteousness,
	SealofWisdom = _SealofWisdom,
	JudgementofWisdom = _JudgementofWisdom,
	TurnEvil = _TurnEvil,
	--Protection
	BlessingofKings = _BlessingofKings,
	BlessingofProtection = _BlessingofProtection,
	BlessingofSacrifice = _BlessingofSacrifice,
	BlessingofSanctuary = _BlessingofSanctuary,
	DivineProtection = _DivineProtection,
	DivineShield = _DivineShield,
	GreaterBlessingofKings = _GreaterBlessingofKings,
	GreaterBlessingofSanctuary = _GreaterBlessingofSanctuary,
	HammerofJustice = _HammerofJustice,
	HammeroftheRighteous = _HammeroftheRighteous,
	HandofSalvation = _HandofSalvation,
	HolyShield = _HolyShield,
	RighteousFury = _RighteousFury,
	SealofJustice = _SealofJustice,
	ShieldofRighteousness = _ShieldofRighteousness,
	--Retribution
	BlessingofMight = _BlessingofMight,
	CrusaderStrike = _CrusaderStrike,
	DivineStorm = _DivineStorm,
	GreaterBlessingofMight = _GreaterBlessingofMight,
	SealofCommand = _SealofCommand,
	SealofCorruption = _SealofCorruption,
	--SealofVengeance = _SealofVengeance, -- resues hords
	--SealoftheCrusader = _SealoftheCrusader,
	JudgementoftheCrusader = _JudgementoftheCrusader,
	JudgementofJustice = _JudgementofJustice,
	JudgementofLight = _JudgementofLight,
	JudgementofWisdom = _JudgementofWisdom,
	--Auras
	ConcentrationAura = _ConcentrationAura,
	DevotionAura = _DevotionAura,
	FireResistanceAura = _FireResistanceAura,
	FrostResistanceAura = _FrostResistanceAura,
	ShadowResistanceAura = _ShadowResistanceAura,
	RetributionAura = _RetributionAura,
}
end
ConROC:UpdateSpellID()

function ConROC:EnableRotationModule()
	self.Description = "Paladin";
	self.NextSpell = ConROC.Paladin.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	ConROC:SpellmenuClass();
--	ConROCSpellmenuFrame:Hide();
end
function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end
		
function ConROC.Paladin.Damage(_, timeShift, currentSpell, gcd)
ConROC:UpdateSpellID()
--Character
	local plvl 												= UnitLevel('player');
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);
 
--Abilities	
	local boMight											= ConROC:AbilityReady(_BlessingofMight, timeShift);
		local bomBuff											= ConROC:Buff(_BlessingofMight, timeShift);	
	local boWisdom											= ConROC:AbilityReady(_BlessingofWisdom, timeShift);
		local bowBuff											= ConROC:Buff(_BlessingofWisdom, timeShift);	
	local boKings											= ConROC:AbilityReady(_BlessingofKings, timeShift);
		local bokBuff											= ConROC:Buff(_BlessingofKings, timeShift);	
	local gBoKings											= ConROC:AbilityReady(_GreaterBlessingofKings, timeShift);
		local gBokBuff											= ConROC:Buff(_GreaterBlessingofKings, timeShift);	
	local boSalv											= ConROC:AbilityReady(_HandofSalvation, timeShift);
		local bosBuff											= ConROC:Buff(_HandofSalvation, timeShift);	
	local consecRDY 										= ConROC:AbilityReady(_Consecration, timeShift);
		local consecDUR 										= consecEXP - GetTime();
	local cStrikeRDY 										= ConROC:AbilityReady(_CrusaderStrike, timeShift);
	local dStormRDY 										= ConROC:AbilityReady(_DivineStorm, timeShift);
	local dPleaRDY 											= ConROC:AbilityReady(_DevinePlea, timeShift);
		local dPleaBUFF 										= ConROC:Buff(_DevinePlea, timeShift);
	local hWrathRDY 										= ConROC:AbilityReady(_HolyWrath, timeShift);
	local hShieldRDY 										= ConROC:AbilityReady(_HolyShield, timeShift);
		local hShieldBUFF, hShieldCount, hShieldDUR				= ConROC:Buff(_HolyShield, timeShift);
		local incBlockBUFF, _, incBlockDUR						= ConROC:Buff(Player_Buff.IncreasedBlock)
	--local gBoSalv											= ConROC:AbilityReady(_GreaterBlessingofSalvation, timeShift);
	--	local gBosBuff											= ConROC:Buff(_GreaterBlessingofSalvation, timeShift);	
	local boSanc											= ConROC:AbilityReady(_BlessingofSanctuary, timeShift);
		local bosaBuff											= ConROC:Buff(_BlessingofSanctuary, timeShift);	
	local gBoSanc											= ConROC:AbilityReady(_GreaterBlessingofSanctuary, timeShift);
		local gBosaBuff											= ConROC:Buff(_GreaterBlessingofSanctuary, timeShift);	
	--local boLight											= ConROC:AbilityReady(_BlessingofLight, timeShift);
	--	local bolBuff											= ConROC:Buff(_BlessingofLight, timeShift);			
	--local judgement, judgeCD, judgeMCD						= ConROC:AbilityReady(Ret_Ability.Judgement, timeShift);	
	local jJustice, jJusticeCD, jJusticeMCD					= ConROC:AbilityReady(_JudgementofJustice, timeShift);	
		local jojDebuff											= ConROC:TargetDebuff(Target_Debuff.JudgementofJustice, timeShift);
	local jLight, jLightCD, jLightMCD						= ConROC:AbilityReady(_JudgementofLight, timeShift);	
		local jolDebuff											= ConROC:TargetDebuff(Target_Debuff.JudgementofLightRank1, timeShift);
	local jWisdom, jWisdom, jWisdomMCD						= ConROC:AbilityReady(_JudgementofWisdom, timeShift);	
		local jowDebuff											= ConROC:TargetDebuff(Target_Debuff.JudgementofWisdomRank1, timeShift);
	--local soCrusader										= ConROC:AbilityReady(_SealoftheCrusader, timeShift);
	--	local socBuff											= ConROC:Buff(_SealoftheCrusader, timeShift);
	local hoJustice											= ConROC:AbilityReady(_HammerofJustice, timeShift);
		local hojDebuff											= ConROC:TargetDebuff(_HammerofJustice, timeShift);
	local hotrRDY, hotrCD									= ConROC:AbilityReady(_HammeroftheRighteous, timeShift);
	local soJustice											= ConROC:AbilityReady(_SealofJustice, timeShift);
		local sojBuff											= ConROC:Buff(_SealofJustice, timeShift);
	local soLight											= ConROC:AbilityReady(_SealofLight, timeShift);
		local solBuff											= ConROC:Buff(_SealofLight, timeShift);
	local soWisdom											= ConROC:AbilityReady(_SealofWisdom, timeShift);
		local sowBuff											= ConROC:Buff(_SealofWisdom, timeShift);
	local soRighteousness									= ConROC:AbilityReady(_SealofRighteousness, timeShift);
		local sorBuff											= ConROC:Buff(_SealofRighteousness, timeShift);	
	local soCommandRDY											= ConROC:AbilityReady(_SealofCommand, timeShift);
		local socomBuff											= ConROC:Buff(_SealofCommand, timeShift);
	local soCorRDY, soCorCD 								= ConROC:AbilityReady(_SealofCorruption, timeShift);
		local soCorBUFF 										= ConROC:Buff(_SealofCorruption, timeShift);
	local exorcism											= ConROC:AbilityReady(_Exorcism, timeShift);
	local sotrRDY, sotrCD									= ConROC:AbilityReady(_ShieldofRighteousness, timeShift);
	
	--local joCRDY 											= ConROC:AbilityReady(_JudgementoftheCrusader, timeShift);
	local joJRDY 											= ConROC:AbilityReady(_JudgementofJustice, timeShift);
	local joLRDY 											= ConROC:AbilityReady(_JudgementofLight, timeShift);
	local joWRDY 											= ConROC:AbilityReady(_JudgementofWisdom, timeShift);
    local judgeDebuff = {
		--joc													= ConROC:TargetDebuff(_JudgementoftheCrusaderDEBUFF, timeShift);
        joj													= ConROC:TargetDebuff(_JudgementofJusticeDEBUFF, timeShift);
		jol													= ConROC:TargetDebuff(_JudgementofLightDEBUFF, timeShift);
        jow													= ConROC:TargetDebuff(_JudgementofWisdomDEBUFF, timeShift);
    }	

	local judgeUp = false;
		for k, v in pairs(judgeDebuff) do
			if v then
				judgeUp = true;
				break
			end
		end
		
--Conditions	
	local isEnemy 											= ConROC:TarHostile();
	local isAutoAttacking 									= IsPlayerAttacking("target");
	local Close 											= CheckInteractDistance("target", 3);
	local tarInMelee										= 0;
	local tarInAoe											= 0;
	
	if IsSpellKnown(_CrusaderStrike) then
		tarInMelee = ConROC:Targets(_CrusaderStrike);
	else
		tarInMelee = ConROC:Targets(_autoAttack);
	end
	if ConROC_AoEButton:IsVisible() and IsSpellKnown(_Consecration) then
		tarInAoe = ConROC:Targets(_Consecration);
	end
--Indicators	
	ConROC:AbilityRaidBuffs(_BlessingofMight, ConROC:CheckBox(ConROC_SM_Bless_Might) and boMight and not bomBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofWisdom, ConROC:CheckBox(ConROC_SM_Bless_Wisdom) and boWisdom and not bowBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_Kings) and boKings and not bokBuff);	
	ConROC:AbilityRaidBuffs(_GreaterBlessingofKings, ConROC:CheckBox(ConROC_SM_Bless_GreaterKings) and gBoKings and not gBokBuff);	
	ConROC:AbilityRaidBuffs(_HandofSalvation, ConROC:CheckBox(ConROC_SM_Bless_Salvation) and boSalv and not bosBuff);	
	--ConROC:AbilityRaidBuffs(Prot_Ability.GreaterBlessingofSalvation, ConROC:CheckBox(ConROC_SM_Bless_GreaterSalvation) and gBoSalv and not gBosBuff);	
	ConROC:AbilityRaidBuffs(_BlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_Sanctuary) and gBoSanc and not gBosaBuff);	
	ConROC:AbilityRaidBuffs(_GreaterBlessingofSanctuary, ConROC:CheckBox(ConROC_SM_Bless_GreaterSanctuary) and gBoSanc and not gBosaBuff);	
	--ConROC:AbilityRaidBuffs(_BlessingofLight, ConROC:CheckBox(ConROC_SM_Bless_Light) and boLight and not bolBuff);
	
--Warnings
	
--Rotations
if plvl < 10 then
	if soRighteousness and not sorBuff then
		return _SealofRighteousness;
	end

	if joLRDY and not jolDebuff then
		return _JudgementofLight;
	end
	if not isAutoAttacking then
		return _autoAttack;
	end
	return nil;
end
if currentSpecName == "Holy" then

end
if currentSpecName == "Protection" then
	if not UnitAffectingCombat("player") and dPleaRDY and not dPleaBUFF then
		return _DevinePlea;
	end
	if not UnitAffectingCombat("player") and hShieldRDY then
		return _HolyShield;
	end
	if dPleaRDY and not dPleaBUFF then
		return _DevinePlea;
	end
	if ConROC:CheckBox(ConROC_SM_Seal_Corruption) and soCorRDY and not soCorBUFF then
		return _SealofCorruption; --using the same variable for Seal of Vengeance, since it is just Hord or Alliance versions
	end
	if consecRDY then
		return _Consecration
	end
	if hShieldRDY and (not hShieldBUFF) and (incBlockDUR <= 1) then
		return _HolyShield;
	end
--[[	if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and joCRDY then
		return _JudgementofJustice;
	end--]]
	if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and joJRDY and not jojDebuff then
		return _JudgementofJustice;
	end
	if ConROC:CheckBox(ConROC_SM_Judgement_Light) and joLRDY and not jolDebuff then
		return _JudgementofLight;
	end
	if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and joWRDY and not jowDebuff then
		return _JudgementofWisdom;
	end
	if sotrRDY and sotrCD <= 3 then
		return _ShieldofRighteousness;
	end
	if hotrRDY and hotrCD <= 3 then
		return _HammeroftheRighteous;
	end
	if not isAutoAttacking then
		return _autoAttack;
	end
	return nil;
end
if currentSpecName == "Retribution" then
	if ConROC_AoEButton:IsVisible() then
		if soCommandRDY and not socomBuff then
			return _SealofCommand;
		end
		if consecRDY then
			return _Consecration
		end
		if dStormRDY then
			return _DivineStorm;
		end
		if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and joJRDY and not jojDebuff then
			return _JudgementofJustice;
		end
		if ConROC:CheckBox(ConROC_SM_Judgement_Light) and joLRDY and not jolDebuff then
			return _JudgementofLight;
		end
		if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and joWRDY and not jowDebuff then
			return _JudgementofWisdom;
		end
		if hWrathRDY and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
			return _HolyWrath;
		end
		if cStrikeRDY then
			return _CrusaderStrike
		end
		if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
			return _Exorcism;
		end
		if not isAutoAttacking then
		return _autoAttack;
	end
	return nil;
	end 

	if tarInMelee > 1 and soCommandRDY and not socomBuff then
		return _SealofCommand;
	end

	if tarInMelee < 1 and ConROC:CheckBox(ConROC_SM_Seal_Corruption) and soCorRDY and not soCorBUFF then
		return _SealofCorruption; --using the same variable for Seal of Vengeance, since it is just Hord or Alliance versions
	end

	if cStrikeRDY then
		return _CrusaderStrike
	end
	if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and joJRDY and not jojDebuff then
		return _JudgementofJustice;
	end
	if ConROC:CheckBox(ConROC_SM_Judgement_Light) and joLRDY and not jolDebuff then
		return _JudgementofLight;
	end
	if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and joWRDY and not jowDebuff then
		return _JudgementofWisdom;
	end
	if dStormRDY then
		return _DivineStorm;
	end
	if consecRDY then
		return _Consecration
	end
	if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
		return _Exorcism;
	end
	if hWrathRDY and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
		return _HolyWrath;
	end
	if not isAutoAttacking then
		return _autoAttack;
	end
	return nil;
end
	-- if (ConROC:CheckBox(ConROC_SM_Role_Healer) and ConROC:TarHostile()) or not ConROC:CheckBox(ConROC_SM_Role_Healer) then
	-- 	--[[ removed ion wrath
	-- 	if ConROC:CheckBox(ConROC_SM_Judgement_Crusader) and soCrusader and not socBuff and not judgeDebuff.joc and (judgeCD >= judgeMCD - 1) then
	-- 		return _SealoftheCrusader;
	-- 	end
	-- 	--]]
		
	-- 	if ConROC:CheckBox(ConROC_SM_Judgement_Justice) and soJustice and not sojBuff and not judgeDebuff.joj and (jJusticeCD >= jJusticeMCD - 1) then
	-- 		return Prot_Ability.SealofJustice;
	-- 	end
		
	-- 	if ConROC:CheckBox(ConROC_SM_Judgement_Light) and soLight and not solBuff and not judgeDebuff.jol and (jLightCD >= jLightMCD - 1) then
	-- 		return _SealofLight;
	-- 	end	
		
	-- 	if ConROC:CheckBox(ConROC_SM_Judgement_Wisdom) and soWisdom and not sowBuff and not judgeDebuff.jow and (jWisdomCD >= jWisdomMCD - 1) then
	-- 		return _SealofWisdom;
	-- 	end	
		
	-- 	if judgement and not judgeUp then
	-- 		return Ret_Ability.Judgement;
	-- 	end	

	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Righteousness) and soRighteousness and not sorBuff then
	-- 		return _SealofRighteousness;
	-- 	end
	-- 	--[[ --removed from wrath
	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Crusader) and soCrusader and not socBuff then
	-- 		return _SealoftheCrusader;
	-- 	end
	-- 	--]]
	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Command) and soCommand and not socomBuff then
	-- 		return _SealofCommand;
	-- 	end	
			
	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Justice) and soJustice and not sojBuff then
	-- 		return Prot_Ability.SealofJustice;
	-- 	end
		
	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Light) and soLight and not solBuff then
	-- 		return _SealofLight;
	-- 	end	
		
	-- 	if ConROC:CheckBox(ConROC_SM_Seal_Wisdom) and soWisdom and not sowBuff then
	-- 		return _SealofWisdom;
	-- 	end	
		
	-- 	if ConROC:CheckBox(ConROC_SM_Stun_HammerofJustice) and hoJustice and judgement then
	-- 		return _HammerofJustice;
	-- 	end

	-- 	if judgement and (socomBuff or sorBuff) then
	-- 		return Ret_Ability.Judgement;
	-- 	end
		
	-- 	if exorcism and (ConROC:CreatureType("Undead") or ConROC:CreatureType("Demon")) then
	-- 		return _Exorcism;
	-- 	end
	-- end
	return nil;
end

function ConROC.Paladin.Defense(_, timeShift, currentSpell, gcd)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources
	local mana 												= UnitPower('player', Enum.PowerType.Mana);
	local manaMax 											= UnitPowerMax('player', Enum.PowerType.Mana);

--Abilities	
	local dAura												= ConROC:AbilityReady(_DevotionAura, timeShift);
		local daBuff											= ConROC:Form(_DevotionAura);
	local rAura												= ConROC:AbilityReady(_RetributionAura, timeShift);
		local raBuff											= ConROC:Form(_RetributionAura);
	local cAura												= ConROC:AbilityReady(_ConcentrationAura, timeShift);
		local caBuff											= ConROC:Form(_ConcentrationAura);
	--local sAura												= ConROC:AbilityReady(Player_Auras.SanctityAura, timeShift);
	--	local saBuff											= ConROC:Form(Player_Auras.SanctityAura);
	local fRAura											= ConROC:AbilityReady(_FireResistanceAura, timeShift);
		local fRBuff											= ConROC:Form(_FireResistanceAura);
	local frRAura											= ConROC:AbilityReady(_FrostResistanceAura, timeShift);
		local frRBuff											= ConROC:Form(_FrostResistanceAura);
	local shaAura											= ConROC:AbilityReady(_ShadowResistanceAura, timeShift);
		local shaBuff											= ConROC:Form(_ShadowResistanceAura);
		
--Conditions
	local playerPh 											= ConROC:PercentHealth('player');

--Rotations
	if dAura and not daBuff and ConROC:CheckBox(ConROC_SM_Aura_Devotion) then
		return _DevotionAura;
	end
	
	if rAura and not raBuff and ConROC:CheckBox(ConROC_SM_Aura_Retribution) then
		return _RetributionAura;
	end
	
	if cAura and not caBuff and ConROC:CheckBox(ConROC_SM_Aura_Concentration) then
		return _ConcentrationAura;
	end
--[[ --removed from wrath
	if sAura and not saBuff and ConROC:CheckBox(ConROC_SM_Aura_Sanctity) then
		return Ret_Ability.SanctityAura;
	end
	--]]
	if fRAura and not fRBuff and ConROC:CheckBox(ConROC_SM_Aura_FireResistance) then
		return _FireResistanceAura;
	end
	
	if frRAura and not frRBuff and ConROC:CheckBox(ConROC_SM_Aura_FrostResistance) then
		return _FrostResistanceAura;
	end
	
	if shaAura and not shaBuff and ConROC:CheckBox(ConROC_SM_Aura_ShadowResistance) then
		return _ShadowResistanceAura;
	end
	
	return nil;
end

function ConROC:JustCasted(spellID)
	if spellID == _Consecration then
		local expTime = GetTime() + 8;
		consecEXP = expTime;
	end
end