-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal')
    state.CastingMode:options('Normal','Resistant','Proc','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Akademos','Khatvanga', 'Fight')

    -------------------------
		-- +3 UPGRADES --
    -------------------------

--	Scholar's > Academic (Artifact)
--Academic +2 & +3 (Omen) 			Kei Scale (2/4)

--Head		P. SCH Card x40	Kei's Scale	Khoma Cloth, S. Faulpie Leather,Cyan Orb x2
--Body		P. SCH Card x50	Kei's Scale	Niobium Ingot, Cypress Lumber,Cyan Orb x3
--Hands		P. SCH Card x35	Kei's Scale	Faulpie Leather x3, Cypress Log,Cyan Orb
--Feet		P. SCH Card x30	Kei's Scale	Azure Cermet x3, Khoma Thread,Cyan Orb

				--DO NOT GET: Legs(Only stun)

--	Argute's > Pedagogy (Relic Attire)=Dynamis Bastok: O Windy: X Sandy: X Jeuno: X
--Pedagogy +2 & +3 (Dynamis)//
--Head,		Headshard: SCH x2	Cyan Coral	Gabbrath Horn x3	>>>		Headshard: SCH x3	Voidhead: SCH x3	Defiant Scarf x3	Pedagogy Mortarboard +3
--Body		Torsoshard: SCH x2	Cyan Coral	Yggdreant Bole x3	>>>		Torsoshard: SCH x3	Voidtorso: SCH x3	Hades' Claw x3		Pedagogy Gown +3

				--DO NOT GET: Feet(Only stun)

--	Savant's > Arbatel (Empy)=Sortie
--Head, Body, Hands, Leg, Feet

    -------------------------
    -------------------------
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book(1, 8)
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    -------------------------------
			-- IDLE SETS --
    -------------------------------

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Befouled Crown",
		body="Arbatel Gown +2",
		hands="Nyame Gauntlets",
		legs="Agwu's Slops",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
}

    sets.idle.PDT = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head="Befouled Crown",
		body="Arbatel Gown +2",
		hands="Nyame Gauntlets",
		legs="Agwu's Slops",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
		
	sets.idle.Weak = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head="Befouled Crown",
		body="Arbatel Gown +2",
		hands="Nyame Gauntlets",
		legs="Agwu's Slops",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}

    -- Resting sets --
    sets.resting = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body="Arbatel Gown +2",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Agwu's Slops",
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
		
    --sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

    -- Defense sets --
    sets.defense.PDT = {		
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}

    sets.defense.MDT = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
		
    sets.defense.MEVA = {
		main="Malignance Pole",
		sub="Achaq Grip",
		ammo="Homiliary",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Loricate Torque +1",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

    -------------------------------
			-- PRECAST --
    -------------------------------

    -- Precast sets to enhance JAs
	
    sets.precast.JA['Tabula Rasa'] = {legs="Peda. Pants +1"} --Argute Dynamis
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +1"} --Dynamis

    -- Fast cast sets for spells

--Increases Fast Cast by 3% to 12% when 2+ set items are worn. 
--The effect is 3% at 2 pieces, 6% at 3 pieces, 9% at 4 pieces and 12% at 5 pieces. 

    sets.precast.FC = {
	--main="Malevolence",  --Musa 80M on AH
	main="Sucellus",																		--5
    sub="Genmei Shield",																	--
    ammo="Incantor Stone",																	--2
    head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+7','"Fast Cast"+7','MND+10',}},	--15
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+23','"Fast Cast"+7','CHR+4',}},--7
    hands="Acad. Bracers +2",																--7
    legs={ name="Merlinic Shalwar", augments={'"Mag.Atk.Bns."+6','"Fast Cast"+7',}},		--7
    feet="Acad. Loafers +2",																--
    neck="Voltsurge Torque",																--4
    waist="Embla Sash",																		--5
    left_ear="Malignance Earring",															--4
    right_ear="Loquac. Earring",															--2
    left_ring="Prolix Ring",																--2
    right_ring="Kishar Ring",																--4
    back={ name="Lugh's Cape", augments={'"Fast Cast"+10',}},								--10
}  																						-----------
																						--	74%
	sets.precast.FC.Arts = {}
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	----------------------------------
			-- MAGIC SETS --
    ----------------------------------
	
	-- Gear for specific elemental nukes.
	--sets.element.Wind = {main="Marin Staff +1"}
	--sets.element.Ice = {main="Ngqoqwanb"}
	--sets.element.Earth = {neck="Quanpur Necklace"}
	--sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    sets.midcast.FastRecast = {
		ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Arbatel Gown +2",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs="Chironic Hose",
		feet="Regal Pumps +1",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Magnetic Earring",
		right_ear="Calamitous Earring",
		left_ring="Defending Ring",
		right_ring="Ephedra Ring",
		back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}

    sets.midcast.LightWeatherCure = {
		main="Daybreak",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Arbatel Gown +2", 
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs="Chironic Hose",
		feet="Regal Pumps +1",
		neck="Incanter's Torque",
		waist="Hachirin-no-Obi",
		--waist="Luminary Sash",
		left_ear="Magnetic Earring",
		right_ear="Calamitous Earring",
		left_ring="Defending Ring",
		right_ring="Ephedra Ring",
		back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}
		
    sets.midcast.LightDayCure = {
		main="Daybreak",
		sub="Sors Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Arbatel Gown +2",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs="Chironic Hose",
		feet="Regal Pumps +1",
		neck="Incanter's Torque",
		--waist="Hachirin-no-Obi",
		waist="Luminary Sash",
		left_ear="Magnetic Earring",
		right_ear="Calamitous Earring",
		left_ring="Defending Ring",
		right_ring="Ephedra Ring",
		back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}

    sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {
    main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','MND+4','Mag. Acc.+15','DMG:+1',}},
    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
	body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}}, --Dynamis clear req +3
	hands="Hieros Mittens",
	legs="Acad. Pants +2", --Omen
    feet="Regal Pumps +1",
    neck="Malison Medallion",
    waist="Bishop's Sash",
    left_ear="Etiolation Earring",
    right_ear="Beatific Earring",
    left_ring="Ephedra Ring",
    right_ring="Ephedra Ring",
    back="Tempered Cape +1",
}
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4','"Mag.Atk.Bns."+18',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		hands="Arbatel Bracers +1",
		legs={ name="Telchine Braconi", augments={'"Cure" potency +2%','Enh. Mag. eff. dur. +7',}},
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Fi Follet Cape +1", --Lustreless Hide - "Fast Cast" +10% Spell Interruption Rate -5%
}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4','"Mag.Atk.Bns."+18',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		hands="Arbatel Bracers +1",
		legs={ name="Telchine Braconi", augments={'"Cure" potency +2%','Enh. Mag. eff. dur. +7',}},
		feet="Telchine Pigaches",
		neck="Incanter's Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Andoaa Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell

    -- Enfeebling --

	sets.midcast['Enfeebling Magic'] = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	neck="Incanter's Torque",
    --neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}

	sets.midcast['Enfeebling Magic'].Resistant = {
	main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
	neck="Incanter's Torque",    
	--neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Obstinate Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",back=gear.nuke_jse_back,waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		head="Acad. Mortar. +2", -- Scholars(Omen)
		body="Acad. Gown +2",
		hands="Kaykaus Cuffs +1",
		legs="Arbatel Pants +1",
		feet="Acad. Loafers +2", --Omen
})

	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
		head="",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands="Kaykaus Cuffs +1",
		legs="Arbatel Pants +1",
		feet="Acad. Loafers +2", --Omen
})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		neck="Incante's Torque",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
		--back="Bookworm Cape",
}

    sets.midcast.Kaustra = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Pixie's Hairpin",
		body="Acad. Gown +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Acad. Pants +2",
		--feet="Agwu's Pigaches",
		neck="Incante's Torque",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
		--back="Bookworm Cape",
}
		
    sets.midcast.Kaustra.Resistant = {}

    sets.midcast.Drain = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		--head="Pixie's Hairpin",
		body="Acad. Gown +2",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Acad. Pants +2",
		--feet="Agwu's Pigaches",
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
		--back="Bookworm Cape",
}
		
    sets.midcast.Drain.Resistant = {}

    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Aspir.Resistant = sets.midcast.Drain.Resistant

    sets.midcast.Stun = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Acad. Mortar. +2", --Omen
		body="Acad. Gown +2", --Omen
		hands="Acad. Bracers +2", --Omen
		legs="Acad. Pants +2",  --Omen
		feet="Peda. Loafers +1", --Dynamis Windy?
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Fucho-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}

    sets.midcast.Stun.Resistant = {}

	----------------------------------
		 --ELEMENTAL MAGIC SETS--
    ----------------------------------
   
  
	sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head={ name="Merlinic Hood", augments={'Mag. Acc.+2','INT+9','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		--head="Agwu's Cap",
		body="Arbatel Gown +2",
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		--hands="Agwu's Gages",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		--legs="Agwu's Slops",
		feet="Arbatel Loafers +2",
	    neck="Incanter's Torque",
		--neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}

    sets.midcast['Elemental Magic'].Resistant = {}
	sets.midcast['Elemental Magic'].Fodder = {}
	sets.midcast['Elemental Magic'].Proc = {}
	sets.midcast['Elemental Magic'].OccultAcumen = {}
	-- Custom refinements for certain nuke tiers
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
	sets.midcast.Impact = {}		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {})
	
		sets.midcast.Helix = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		--sub="Culminus", --One to be feared HTMB
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		--head="Agwu's Cap",
		--body="Agwu's Robe",
		--hands="Agwu's Gages",
		--legs="Agwu's Slops",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+2','INT+9','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		body="Amalric Doublet +1",
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Arbatel Loafers +2",
		neck="Incanter's Torque",
		--neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Acuity Belt +1",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Mallquis Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}
	
	sets.midcast.Helix.Resistant = {}
	sets.midcast.Helix.Proc = {}
		
	------------------------------
		-- MAGIC BURST SETS --
    ------------------------------
	
    sets.MagicBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+2','INT+9','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		--head="Agwu's Cap",
		body="Arbatel Gown +2",
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		--hands="Agwu's Gages",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		--legs="Agwu's Slops",
		feet="Arbatel Loafers +2",
		neck="Incanter's Torque",
		--neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Acuity Belt +1",
		--waist="Hachirin-no-Obi",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}

    sets.HelixBurst = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		--sub="Culminus", --One to be feared HTMB
		ammo="Ghastly Tathlum +1",
		--head="Agwu's Cap",
		--body="Agwu's Robe",
		--hands="Agwu's Gages",
		--legs="Agwu's Slops",
		head={ name="Merlinic Hood", augments={'Mag. Acc.+2','INT+9','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		body="Amalric Doublet +1",
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Arbatel Loafers +2",
		neck="Incanter's Torque",
		--neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Acuity Belt +1",
		left_ear="Regal Earring", --Arbatel Earring +2 (Sortie)
		right_ear="Malignance Earring",
		left_ring="Mujin Band",
		right_ring="Mallquis Ring",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}
		
    sets.ResistantHelixBurst = {}
		
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		main="Bolelabunga",
		sub="Genmei Shield",
		ammo="Homiliary",
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
        body="Jhakri Robe +2",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Sheltered Ring",
        back="Umbra Cape",
		waist="Flax Sash",
		legs="Assid. Pants +1",
		feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Malignance Pole",
    sub="Irenic Strap +1",
    ammo="Staunch Tathlum +1",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Etiolation Earring",
    right_ear="Lugalbanda Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back="Moonbeam Cape",}

    -------------------------------
		-- WEAPONSKILL SETS --
    -------------------------------
	
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {
		ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Evans Earring",
		ear2="Etiolation Earring",
		body="Amalric Doublet",
		hands="Regal Cuffs",
		ring1="Mephitas's Ring +1",
		ring2="Mephitas's Ring",
		back="Aurist's Cape +1",
		waist="Yamabuki-no-Obi",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +2"}
	sets.HPDown = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff['Light Arts'] = {legs="Academic's Pants +2"}
	sets.buff['Dark Arts'] = {body="Academic's Gown +2"}
	
	sets.buff.Sublimation = {
	head="Acad. Mortar. +2",
	body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
	waist="Embla Sash",
}

    sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	sets.buff.DTSublimation = {waist="Embla Sash"}

    --sets.buff.FullSublimation = {}
   -- sets.buff.PDTSublimation = {}
	
	-- Weapons sets
	sets.weapons.Akademos = {main="Akademos",sub="Niobid Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Fight = {main="Opashoro",sub="Alber Strap"}
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 8)
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 18')
end

send_command('wait 2;input /lockstyleset 18')