function user_setup()
	-- Options: Override default values
	state.CastingMode:options('Normal','Resistant','Fodder','Proc','OccultAcumen')
	state.OffenseMode:options('Normal')
	state.IdleMode:options('Normal','PDT','DTHippo')
	state.Weapons:options('None','NukeWeapons','Khatvanga','Malevolence')

	gear.obi_cure_waist = "Witful Belt"
	gear.obi_low_nuke_waist = "Sekhmet Corset"
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	gear.nuke_jse_back = {name="Taranus's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.stp_jse_back = {name="Taranus's Cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode') 
	send_command('bind ~^` gs c cycleback ElementalMode') --Robbiewobbie's idea
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons Default;gs c reset CastingMode;gs c reset DeathMode;gs c reset MagicBurstMode')
	send_command('bind !r gs c set DeathMode Single;gs c set MagicBurstMode Single')
	send_command('bind !\\\\ input /ja "Manawell" <me>')
	send_command('bind !` input /ma "Aspir III" <t>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f9 gs c cycle DeathMode')
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace input /ja "Enmity Douse" <t>')
	send_command('bind @backspace input /ja "Alacrity" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind @= input /ja "Addendum: White" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
    
	select_default_macro_book(1, 2)
end

function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.NukeWeapons = {main=gear.grioavolr_nuke_staff,sub="Enki Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
	sets.weapons.Malevolence = {main="Malevolence",sub="Ammurapi Shield"}
	
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}	
	
	-- Treasure Hunter
	
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
    
    ---- Precast Sets ----
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {back=gear.nuke_jse_back,feet="Wicce Sabots +1"}

    sets.precast.JA.Manafont = {} --body="Sorcerer's Coat +2"
    
    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    -- Fast cast sets for spells

    sets.precast.FC = {
		ammo="Impatiens",
		head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+22','Magic burst dmg.+8%','CHR+14','Mag. Acc.+14',}},
		body={ name="Merlinic Jubbah", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+10%','CHR+6','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Merlinic Crackows", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+10%','INT+4',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ammo="Staunch Tathlum +1 +1",ear1="Malignance Earring",ring2="Prolix Ring",back="Swith Cape +1",waist="Siegel Sash"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1",body="Heka's Kalasiris"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})

	sets.precast.FC.Death = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Impatiens",
        head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
        body=gear.merlinic_nuke_body,hands="Volte Gloves",ring1="Mephitas's Ring +1",ring2="Lebeche Ring",
        back="Perimede Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Dosis Tathlum",
		head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
		head="Hagondes Hat +1",neck="Saevus Pendant +1",ear1="Friomisi Earring",ear2="Crematio Earring",
		body="Zendik Robe",hands="Hagondes Cuffs +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back=gear.nuke_jse_back,waist="Fotia Belt",legs="Hagondes Pants +1",feet=gear.merlinic_nuke_feet}

    sets.precast.WS['Myrkr'] = {
		main="Lathi",
		sub="Elder's Grip +1",
		ammo="Strobilus",
		head="Pixie Hairpin +1",
		body={ name="Weatherspoon Robe", augments={'MP+120',}},
		hands="Otomi Gloves",
		legs="Amalric Slops",
		feet="Llwyd's Clogs",
		neck="Dualism Collar +1",
		waist="Shinjutsu-no-Obi",
		left_ear="Andoaa EaRing",
		right_ear="Loquac. EaRing",
		left_ring="Mephitas's Ring",
		right_ring="Mephitas's Ring +1",
		back="",}
		
	sets.MaxTPMyrkr = {ear1="Evans Earring",ear2="Etiolation Earring"}
    
    
    ---- Midcast Sets ----

    sets.midcast.FastRecast = {main="Lathi",ammo="Incantor Stone",
		head="Amalric Coif",neck="Orunmila's Torque",ear1="Loquacious EaRing",ear2="Enchanter EaRing +1",
		body="Helios Jacket",hands="Gendewitha Gages +1",ring1="Weatherspoon Ring",ring2="Prolix Ring",
		back="Ogapepo Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Pedagogy Loafers +1",}

    sets.midcast.Cure = {
	    ammo="Oreiad's Tathlum",
        head="haruspex Hat +1",
        neck="Colossus's Torque",
        ear1="beatific EaRing",
        ear2="healing EaRing",
        body="Heka's Kalasiris",
        hands="Telchine gloves",
        ring1="Sirona's Ring",
        ring2="Haoma's Ring",
        back="Tempered Cape +1",
        waist="Bishop's Sash",
        legs="Assiduity pants +1",
        feet="Regal Pumps +1"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Heka's Kalasiris",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Serenity",sub="Curatio Grip",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Phalaina Locket",ear1="Gifted Earring",ear2="Etiolation Earring",
        body="Zendik Robe",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Menelaus's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Psycloth Lappas",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	sets.midcast['Enhancing Magic'] = {
	    head="Befouled Crown",
		neck="Colossus's Torque",
        body="Anhur robe",
        hands="",
        ring1="Prolix Ring",
        ring2="Veneficium Ring",
        waist="Olympus Sash",
        legs="",
        feet="Rubeus Boots"}
    
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash",neck="Stone Gorget",ear1="Earthcry EaRing"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast['Enfeebling Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		body="Spae. Coat +1",
		hands="Regal Cuffs",
		legs="Spae. Tonban +2",
		feet="Spae. Sabots +2",
		neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist="Acuity Belt +1",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Regal Earring",
        body="Vanya Robe",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Skaoi Boots"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear1="Malignance Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear1="Malignance Earring",waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})

    sets.midcast['Dark Magic'] = {			
		main="Lathi",
        sub="Elder's Grip +1",
		ammo="Oreiad's Tathlum",
		head="Jhakri Coronal +1",
		body="Merlinic Jubbah",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
        neck="Dark Torque",
        ear1="Barkaro. Earring",
        ear2="Hirudinea Earring",
        ring1="Shiva Ring +1",
        ring2="Fenrir Ring +1",
        back="Bane Cape",
        waist="Austerity Belt",}

    sets.midcast.Drain = {
		main="Lathi",
        sub="Elder's Grip +1",
		ammo="Oreiad's Tathlum",
		head="Jhakri Coronal +1",
		body="Merlinic Jubbah",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Merlinic Crackows",
        neck="Dark Torque",
        ear1="Barkaro. Earring",
        ear2="Hirudinea Earring",
        ring1="Shiva Ring +1",
        ring2="Fenrir Ring +1",
        back="Bane Cape",}
    
    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Aspir.Death = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
	
	sets.midcast.Death = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Mizu. Kubikazari",ear1="Malignance Earring",ear2="Etiolation Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Mujin Band",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast.Stun = {
	    main="Lathi",
		sub="Benthos Grip",
		ammo="Oreiad's Tathlum",
		head="Nahtirah Hat",
		body="Vanir Cotehardie",
		hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -4%','Mag. Acc.+23',}},
		legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
		feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
		neck="Dark Torque",
		waist="Ninurta's Sash",
		left_ear="Enchntr. EaRing +1",
		right_ear="Loquac. EaRing",
		left_ring="Weather. Ring",
		right_ring="Prolix Ring",
		back={ name="Bane Cape", augments={'Elem. magic skill +2','Dark magic skill +3','"Mag.Atk.Bns."+4','"Fast Cast"+3',}},
}
		
    sets.midcast.Stun.Resistant = {
		main="Lathi",
		sub="Benthos Grip",
		ammo="Oreiad's Tathlum",
		head="Nahtirah Hat",
		body="Vanir Cotehardie",
		hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -4%','Mag. Acc.+23',}},
		legs={ name="Artsieq Hose", augments={'MP+30','Mag. Acc.+20','MND+7',}},
		feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
		neck="Dark Torque",
		waist="Ninurta's Sash",
		left_ear="Enchntr. EaRing +1",
		right_ear="Loquac. EaRing",
		left_ring="Weather. Ring",
		right_ring="Prolix Ring",
		back={ name="Bane Cape", augments={'Elem. magic skill +2','Dark magic skill +3','"Mag.Atk.Bns."+4','"Fast Cast"+3',}},
}
	

    sets.midcast.BardSong = {main="Daybreak",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head="Amalric Coif +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Regal Earring",
        body="Zendik Robe",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Luminary Sash",legs="Merlinic Shalwar",feet="Medium's Sabots"}
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Malignance Earring",ear2="Regal Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    -- Elemental Magic sets
    
    sets.midcast['Elemental Magic'] = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Merlinic Hood", --Wicce Petasos +3
		body="Amalric Doublet +1", --Wicce Coat +3
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}, --Wicce Gloves +3
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --Wicce Chausses +3
		feet="Jhakri Pigaches +1", --Wicce Sabots +3
		neck="Src. Stole +2",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1", --Freke Ring
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
}

    sets.midcast['Elemental Magic'].Resistant = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Merlinic Hood", --Wicce Petasos +3
		body="Amalric Doublet +1", --Wicce Coat +3
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}, --Wicce Gloves +3
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --Wicce Chausses +3
		feet="Jhakri Pigaches +1", --Wicce Sabots +3
		neck="Src. Stole +2",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1", --Freke Ring
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Taranus's Cape",
}

    sets.midcast['Elemental Magic'].Fodder = {}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})

	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
	
	sets.midcast.Helix = sets.midcast['Elemental Magic']
	
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant
		
		-- Minimal damage gear, maximum recast gear for procs.
    sets.midcast['Elemental Magic'].Proc = {
		main=empty,
		sub=empty,
		ammo="Impatiens",
        head="Nahtirah Hat",
		neck="Loricate Torque +1",
		ear1="Gifted Earring",
		ear2="Loquacious Earring",
        body="Spaekona's Coat +3",
		hands="Hagondes Cuffs +1",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
        back="Swith Cape +1",
		waist="Witful Belt",
		legs="Assid. Pants +1",
		feet="Regal Pumps +1"
}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {
		main="Khatvanga",
		sub="Bloodrain Strap",
		ammo="Seraphic Ampulla",
        head="Mall. Chapeau +2",
		neck="Combatant's Torque",
		ear1="Dedition Earring",
		ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,
		ring1="Rajas Ring",
		ring2="Petrov Ring",
        back=gear.stp_jse_back,
		waist="Oneiros Rope",
		legs="Perdition Slops",
		feet=gear.merlinic_occult_feet
}
		
    sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
	
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Chatoyant Staff",
		neck="Grandiose Chain",
		waist="Austerity Belt",
}
    
    -- Idle sets
    
    -- Normal refresh idle set
    sets.idle = {
    main="Malignance Pole",
    sub="Mensch Strap",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Jhakri Robe +2",
    hands="Nyame Gauntlets",
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape",
}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT = {
		main="Malignance Pole",
		sub="Mensch Strap",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Genmei Earring",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Defending Ring",
        ring2="Vocane Ring +1",
		back="Solemnity Cape",
		waist="Isa Belt",
		legs="Assid. Pants +1",
		feet="Jhakri Pigaches +1"
}
		
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {feet="Hippo. Socks +1"})

	sets.idle.Death = {
	    ammo="Ghastly Tathlum +1",
		neck="Sanctity necklace",
		body="Respite Cloak",
		hands="Regal Cuffs",
		legs="Wicce Chausses +1",
		feet="Wicce Sabots +1",
		waist="Acuity Belt +1",
		left_ear="Loquac. Earring",
		right_ear="Etiolation Earring",
		left_ring="Mephitas's Ring",
		right_ring="Mephitas's Ring +1",
}

    sets.idle.Weak = {
    main="Malignance Pole",
    sub="Mensch Strap",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring +1",
    back="Moonbeam Cape",
}

    -- Defense sets

    sets.defense.PDT = {
		main="Lathi",
		sub="Elder's Grip +1",
		ammo="Pemphredo Tathlum",
		head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Barkaro. Earring",
		ear2="Genmei Earring",
		body="Jhakri Robe +2",
		hands="Serpentes Cuffs",
		ring1="Shiva Ring +1",
		ring2="Shiva Ring +1",
		back="Solemnity Cape",
		waist="Othila Sash",
		legs="Assid. Pants +1",
		feet="Serpentes Sabots"
}

    sets.defense.MDT = {
		main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Staunch Tathlum +1 +1",
        head="Hagondes Hat +1",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation Earring",
        body="Mallquis Saio +2",
		hands="Hagondes Cuffs +1",
		ring1="Defending Ring",
		ring2="Shadow Ring",
        back="Solemnity Cape",
		waist="Flax Sash",
		legs="Hagondes Pants +1",
		feet="Mallquis Clogs +2"
}
		
    sets.defense.MEVA = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Staunch Tathlum +1 +1",
        head=gear.merlinic_nuke_head,
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2="Etiolation Earring",
		body=gear.merlinic_nuke_body,
		hands="Amalric Gages +1",
		ring1="Vengeful Ring",
		ring2="Purity Ring",
        back=gear.nuke_jse_back,
		waist="Luminary Sash",
		legs="Hagondes Pants +1",
		feet=gear.merlinic_nuke_feet
}

	sets.Kiting = {feet="Herald's Gaiters"}
	
    sets.latent_refresh = {waist="Fucho-no-obi"}
	
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	
	sets.TPEat = {neck="Chrys. Torque"}
	
	sets.DayIdle = {feet=gear.merlinic_refresh_feet}
	
	sets.NightIdle = {}
	
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Genmei Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
		
	sets.HPCure = {main=gear.gada_healing_club,sub="Sors Shield",ammo="Hasty Pinion +1",
		head="Blistering Sallet +1",neck="Nodens Gorget",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Kunaji Ring",ring2="Meridian Ring",
		back="Tempered Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff['Mana Wall'] = {
		feet="Wicce Sabots +1",
		back="Taranus's Cape",
}
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Spaekona's Coat +3"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {    
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Alber Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --Wicce Coat +3
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}, --Agwu's Gages
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}}, --Wicce Chausses +3
		feet={ name="Arch. Sabots +3", augments={'Increases Aspir absorption amount',}}, --Agwu's Pigaches
		neck={ name="Src. Stole +2", augments={'Path: A',}},
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Mujin Band",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Taranus's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}

	sets.ResistantMagicBurst = {}
	
	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {}

	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 2)
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 18')
end

send_command('wait 2;input /lockstyleset 18')