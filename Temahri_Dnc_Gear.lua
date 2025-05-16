-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc')
    state.HybridMode:options('Normal','DTLite','PDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc')
	state.IdleMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas')

    -- Additional local binds
    send_command('bind @` gs c step')
	send_command('bind ^!@` gs c toggle usealtstep')
	send_command('bind ^@` gs c cycle mainstep')
	send_command('bind !@` gs c cycle altstep')
    send_command('bind ^` input /ja "Saber Dance" <me>')
    send_command('bind !` input /ja "Fan Dance" <me>')
	send_command('bind ^\\\\ input /ja "Chocobo Jig II" <me>')
	send_command('bind !\\\\ input /ja "Spectral Jig" <me>')
	send_command('bind !backspace input /ja "Reverse Flourish" <me>')
	send_command('bind ^backspace input /ja "No Foot Rise" <me>')
	send_command('bind %~` gs c cycle SkillchainMode')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

------Gear to get------

--Ambu Capes:
--• TP Cape (/SAM): DEX30/Att-Acc/STP
--• TP Cape (/WAR): DEX30/Att-Acc/DA - DONE			Optional:MagEVA+15
--• Evisc Cape: 	DEX30/Att-Acc/Crit - DONE		Optional:PhDMG-10
--• Rudras Cape:	DEX30/Att-Acc/WSD
--• FC & AE Cape: 	INT20/FC10/MagAcc-MagDmg20 Can use for Violent Flourish too, requires INT/Macc
--• MEVA TP Cape: 	DEX20/MagEVA +10/StoreTP+10/Eva20-MAEva2-/Occ resist stat ailments +10

--JA Capes
--• Waltz Cape: 	CHR
--• Steps Cape:		DEX/Acc
--• RF Cape:		Reverse Flourish 30

--Relic
--Body (Horos casaque +1 > Horos casaque +3)
--Feet (Horos toe shoes +1 > Horos toe shoes +3)

--Empy (Muffins)
--Head Maculele tiara +1 > Maculele tiara +3
--Legs Maculele tights +1 (Not sure if actually need but already upgraded to +1)

--Meg. Cuirie +1, -- Need to +2 ambu
--Mummu Wrists +1, -- Need to +2 ambu

--Regal Ring, Ou

--To Buy??
--Balder Earring +1, 75M on AH
--Etoile Gorget +2, 41M on AH

    --------------------------------
     -- Start defining the sets --
    --------------------------------
	
	------------------------------
	  ------ Idle sets ------
	------------------------------

    sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Nyame Gauntlets",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Windbuffet Belt +1",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring +1",
		back="Solemnity Cape",
}

	------------------------------
	  ------ Engaged sets ------
	------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
	
	--45%/Max Magic Haste (0% Dual Wield needed)
    sets.engaged = {
		ammo="Yamarang", --"Aurgelmir Orb +1", 
		head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
		body="Malignance Tabard", --"Horos Casaque +3",  --Relic
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Attack+10','"Triple Atk."+4','STR+9',}}, --"Horos T. Shoes +3", --Relic
		neck="", --Etoile Gorget +2, AH
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Brutal Earring", --Balder Earring +1, AH
		left_ring="Epona's Ring",
		right_ring="Gere Ring",
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}

--• Adhemar: Path B or A
--• TP Cape (/SAM): DEX/Acc/STP 
--• TP Cape (/WAR): DEX/Acc/DA This set is equipped in engaged ^
		
    sets.engaged.DTLite = {}
    sets.engaged.Acc = {}
    sets.engaged.SomeAcc = {}
    sets.engaged.PDT = {}
	   
	------------------------------
	------ Weaponskill sets ------
	------------------------------
    -- Default set for any weaponskill that isn't any more specifically defined
	
    sets.precast.WS = {
		ammo="Crepuscular Pebble",
		head="Maculele Tiara +1", --head="Maculele Tiara +3",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget", --Etoile Gorget +2,  AH
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring", --Regal Ring, Ou
		back="Null Shawl", --"Senuna's Mantle", not specific set so not sure what augs
}

    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Maculele Tiara +1", --head="Maculele Tiara +3",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget", --Etoile Gorget +2,  AH
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring", --"Macu. Earring +2", --JSE Earring Sortie
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring", --Regal Ring: Ou
		back="Null Shawl", --Senuna's Mantle: Ambu > Augments DEX/Att/Acc/WSD
})

    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
		ammo="Charis Feather",
		head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}, --Adhemar: Path B +1
		body="Meg. Cuirie +1", -- Need to +2 ambu
		hands="Mummu Wrists +1", -- Need to +2 ambu
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}}, --"Lustr. Subligar +1", Path B - Triton Abjuration: Legs
		feet={ name="Herculean Boots", augments={'Attack+10','"Triple Atk."+4','STR+9',}}, --Herc: DEX/Att/Acc/CritDmg
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear="Sherida Earring",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring", --Regal Ring: Ou
		back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
})

    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	--Irrelevant set as need Mythic--
    sets.precast.WS['Pyrrhic Kleos'] = set_combine(sets.precast.WS, {
	    ammo="Crepuscular Pebble",
		head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}}, --Gleti's Mask
		body="Gleti's Cuirass", 
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}, --"Gleti's Gauntlets",
		legs="Nyame Flanchard", --Maculele Tights +3, Empy already started to upgrade so will leave NQ for now
		feet="Gleti's Boots", --Lustra. Leggings +1: Path D. Triton Abj
		neck="Fotia Gorget", --Etoile Gorget +2, AH
		waist="Fotia Belt",
		left_ear="Brutal Earring", --Macu. Earring +2, JSE Earring: Sortie
		right_ear="Sherida Earring",
		left_ring="Epona's Ring", --Regal Ring: Ou
		right_ring="Gere Ring",
		back="Null Shawl", --Senuna's Mantle: Ambu > Augments STR/Att/Acc/DA
})

    sets.precast.WS['Pyrrhic Kleos'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Pyrrhic Kleos'].Acc = set_combine(sets.precast.WS.Acc, {})

    sets.precast.WS['Aeolian Edge'] = {}
    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	
    sets.Skillchain = {} --hands="Charis Bangles +2"
    
    ------------------------------
	  ------ Midcast sets ------
	------------------------------
    
    sets.midcast.FastRecast = {}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
	
	-- Defense sets

    sets.defense.PDT = {}
    sets.defense.MDT = {}
	sets.defense.MEVA = {}

    sets.Kiting = {}
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Taming Sari"}
	
    ------------------------------
	  ------ Precast sets ------
	------------------------------
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {}
    sets.precast.JA['Trance'] = {}
    

    -- Waltz set (chr and vit)
		sets.precast.Waltz = {}
		sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
	
--Refer here > Abilities Sets: https://www.ffxiah.com/forum/topic/53853/the-last-dance-iii-a-dancers-guide-new/#_user-5-ab
--This gear is from the guide.. Do we need it?
	
    sets.precast.Waltz['Healing Waltz'] = {
		ammo="Yamarang",
		head="Anwig Salade", --Anwig Salade: CHR+4 Waltz ability delay -2 ... probably do not bother...
		neck="Etoile Gorget +2",
		ear1="Enchntr. Earring +1",
		ear2="Handler's Earring +1",
		body="Maxixi Casaque +3",
		hands="Regal Gloves",
		ring1="Carb. Ring +1",
		ring2="Carb. Ring +1",
		back="Senuna's Mantle", --Cape: CHR
		waist="Aristo Belt",
		legs="Dashing Subligar",
		feet="Maxixi Toe Shoes +3"
}
    
    sets.precast.Samba = {}

    sets.precast.Jig = {}

    sets.precast.Step = {
		sub="Setan Kober",
		ammo="Yamarang",
		head="Maxixi Tiara +3",
		neck="Etoile Gorget +2",
		ear1="Mache Earring +1",
		ear2="Mache Earring +1",
		body="Maxixi Casaque +3",
		hands="Maxixi Bangles +3",
		ring1="Regal Ring",
		ring2="Chirich Ring +1",
		back="Senuna's Mantle", --• Cape: DEX/Acc
		waist="Olseni Belt",
		legs="Maxixi Tights +3",
		feet="Horos T. Shoes +3"
}
		
    sets.Enmity = {}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {
		ammo="Yamarang",
		head="Mummu Bonnet +2",
		neck="Etoile Gorget +2",
		ear1="Digni. Earring",
		ear2="Hermetic Earring",
		body="Horos Casaque +3",
		hands="Mummu Wrists +2",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Senuna's Mantle", --• Cape: INT/Macc
		waist="Eschan Stone",
		legs="Horos Tights +3",
		feet="Mummu Gamash. +2"
}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
    sets.precast.Flourish1['Desperate Flourish'] = {}
    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {
	hands="Macu. Bangles +1",
    back="Toetapper Mantle" -- • Cape: Reverse Flourish 30
}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {}
    sets.precast.Flourish3['Climactic Flourish'] = {}

	------------------------------
	 ------ Fast Cast sets ------
	------------------------------
    -- Fast cast sets for spells
    
    sets.precast.FC = {}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})
	
	------------------------------
	  ------- Buff sets -------
	------------------------------
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
    sets.buff['Saber Dance'] = {} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Adhemar Bonnet +1",body="Meg. Cuirie +2"} --head="Charis Tiara +2"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 19)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 1)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 1)
    else
        set_macro_page(19, 1)
    end
end