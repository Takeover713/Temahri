function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10'}}
	gear.idle_jse_back = {name="Nantosuelta's Cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10'}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = "Fury"
	autogeo = "Frailty"
	autoentrust = "Haste"
	autoentrustee = "Rafleshia"
	
	-- buff_spell_lists = {
	-- Auto = {	
		-- {Name='Haste',		Buff='Haste',		SpellID=57,		When='false'},
		-- {Name='Refresh',	Buff='Refresh',		SpellID=109,	When='false'},
	-- },
	
	-- Default = {
		-- {Name='Haste',		Buff='Haste',		SpellID=57,		Reapply=false},
		-- {Name='Refresh',	Buff='Refresh',		SpellID=109,	Reapply=false},
		-- {Name='Aquaveil',	Buff='Aquaveil',	SpellID=55,		Reapply=false},
		-- {Name='Stoneskin',	Buff='Stoneskin',	SpellID=54,		Reapply=false},
		-- {Name='Blink',		Buff='Blink',		SpellID=53,		Reapply=false},
		-- {Name='Regen',		Buff='Regen',		SpellID=108,	Reapply=false},
		-- {Name='Phalanx',	Buff='Phalanx',		SpellID=106,	Reapply=false},
	-- },
-- }
	
	-- Additional local binds
	-- send_command('bind ^` gs c cycle ElementalMode')
	-- send_command('bind !` input /ja "Full Circle" <me>')
	-- send_command('bind @f8 gs c toggle AutoNukeMode')
	-- send_command('bind @` gs c cycle MagicBurstMode')
	-- send_command('bind @f10 gs c cycle RecoverMode')
	-- send_command('bind ^backspace input /ja "Entrust" <me>')
	-- send_command('bind !backspace input /ja "Life Cycle" <me>')
	-- send_command('bind @backspace input /ma "Sleep II" <t>')
	-- send_command('bind ^delete input /ma "Aspir III" <t>')
	-- send_command('bind @delete input /ma "Sleep" <t>')
	-- send_command('bind !pause gs c toggle AutoBuffMode')

	
	indi_duration = 290
	
	select_default_macro_book(1, 5)
end

function init_gear_sets()


	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3",hands="Bagua Mitaines +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	sets.WakeUpWeapons = {main="Prime Maul"}
	
	-- Fast cast sets for spells

	sets.precast.FC = {    
	main="C. Palug Hammer",
    sub="Genmei Shield",
    range="Dunna",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+2','INT+9','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic burst dmg.+10%','CHR+6','Mag. Acc.+13','"Mag.Atk.Bns."+13',}},
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
    feet="Regal Pumps +1",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back="Solemnity Cape",
	}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal",ear2="Barkaro. Earring",hands="Bagua Mitaines +1"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genmei Shield",back="Pahtli Cape"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Twilight Cloak"}

	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {        head="Nahtirah Hat",
		neck=gear.ElementalGorget,
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
        body="Vanir Cotehardie",
		hands="Yaoyotl Gloves",
		ring1="Rajas Ring",
		ring2="K'ayres Ring",
        back="Refraction Cape",
		waist=gear.ElementalBelt,
		legs="Hagondes Pants",
		feet="Hagondes Sabots"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {    
	main="Solstice",
    range="Dunna",
    head="Merlinic Hood",
    body="",
    hands="",
    legs="",
    feet="",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="",
    back="Perimede Cape"}

	sets.midcast.Geomancy = {	
	main="Idris",
    sub="Genmei Shield",
    range="Dunna",
    head="Azimuth Hood +3",
    body="Bagua Tunic +1",
    hands="Geo. Mitaines +2",
    legs="Bagua Pants +1",
    feet="Azimuth Gaiters +1",
    neck="Bagua Charm +2",
    waist="Austerity Belt",
    left_ear="Magnetic Earring",
    right_ear="Calamitous Earring",
    left_ring="Vocane Ring +1",
    right_ring="Defending Ring",
    back="Lifestream Cape"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {
	--range="Dunna",
	--legs="Bagua Pants +3",
	--feet="Azimuth Gaiters +2", --+3 Sortie
	--back="Lifestream Cape", --indi Duration +20%
})
		
    sets.midcast.Cure = {   
		main="Daybreak",
		sub="Sors Shield",
		range="Dunna",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		legs="Vanya Slops",
		feet={ name="Vanya Clogs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Meili Earring",
		right_ear="Mendi. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Tempered Cape +1",
}
		
	sets.midcast.LightWeatherCure = {}
		
		--Cureset for if it's not light weather but is light day.
	sets.midcast.LightDayCure = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Menelaus's Ring",ring2="Haoma's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {		
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}

    sets.midcast['Elemental Magic'].Resistant = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}
		
    sets.midcast['Elemental Magic'].Fodder = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist={ name="Acuity Belt +1", augments={'Path: A',}},
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Freke ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}

		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'] = {		
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4','"Mag.Atk.Bns."+18',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back="Aurist's Cape +1",
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {		
		main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','Mag. Acc.+4','"Mag.Atk.Bns."+18',}},
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back="Aurist's Cape +1",
}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {head="Amalric Coif +1",ear2="Barkaro. Earring",waist="Acuity Belt +1"})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {range=empty,ring1="Stikini Ring"})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {range=empty,ring1="Stikini Ring"})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring"})
		
	sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="Magnetic Earring",
		body="Jhakri Robe +2",
		hands="Telchine Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Fi Follet Cape +1",
		waist="Olympus Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ammo="Oreiad's Tathlum",ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Magnetic Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Magnetic Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Magnetic Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Magnetic Earring",ear2="Loquacious Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {		
		main="Chatoyant Staff",
		ammo="Clarus Stone",
		head="Befouled Crown",
		neck="Grandiose Chain",
        body="Jhakri Robe +2",
		hands="",
		legs="Assid. Pants +1",
		feet="",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		left_ear="Magnetic Earring",
		right_ear="Relaxing Earring",
		back="",
        waist="Austerity Belt"
}

	-- Idle sets

	sets.idle = {    
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +1",
		hands="Bagua Mitaines +1",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +1",
		neck="Loricate Torque +1",
		waist="Null Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Vocane Ring +1",
		right_ring="Defending Ring",
		back="Solemnity Cape"
}
		
	sets.idle.PDT = {		
		main="Malignance Pole",
		sub="Achaq Grip",
		range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
		head="Azimuth Hood +3",
		body="Azimuth Coat +1",
		hands="Geo. Mitaines +2",
		legs="Assid. Pants +1",
		feet="Geo. Sandals +1",
		neck="Loricate Torque +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Vocane Ring +1",
		right_ring="Defending Ring",
		waist="Isa Belt",
		back={ name="Nantosuelta's Cape", augments={'Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {		
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +1",
		hands="Geo. Mitaines +2",
		legs="Assid. Pants +1",
		feet="Bagua Sandals +1",
		neck="Loricate Torque +1",
		back={ name="Nantosuelta's Cape", augments={'Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Isa Belt",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		ring1="Vocane Ring +1",
		ring2="Defending Ring"}

	sets.idle.PDT.Pet = {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +1",
		hands="Geo. Mitaines +2",
		legs="Assid. Pants +1",
		feet="Bagua Sandals +1",
		neck="Loricate Torque +1",
		back={ name="Nantosuelta's Cape", augments={'Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Isa Belt",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		ring1="Vocane Ring +1",
		ring2="Defending Ring"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Bagua Tunic +1",
		hands="Geo. Mitaines +2",
		legs="Assid. Pants +1",
		feet="Bagua Sandals +1",
		neck="Loricate Torque +1",
		waist="Austerity Belt",
		left_ear="Genmei Earring",
		right_ear="Loquacious Earring",
		ring1="Vocane Ring +1",
		ring2="Defending Ring",
		back="Lifestream Cape"})
	
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {
		main="Idris",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +3",
		body="Azimuth Coat +1",
		hands="Geo. Mitaines +2",
		legs="Assid. Pants +1",
		feet="Bagua Sandals +1",
		neck="Loricate Torque +1",
		back={ name="Nantosuelta's Cape", augments={'Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Isa Belt",
		ear1="Handler's Earring +1",
		ear2="Handler's Earring",
		ring1="Vocane Ring +1",
		ring2="Defending Ring"})
		
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants +1"}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {    
	main="Malignance Pole",
	sub="Achaq Grip",
    range="Dunna",
	head="Azimuth Hood +3",
    body="Azimuth Coat +1",
    hands="Geo. Mitaines +2",
    legs="Assid. Pants +1",
    feet="Geo. Sandals +1",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    ring1="Vocane Ring +1",
    right_ring="Defending Ring",
    back="Solemnity Cape"}

	-- Defense sets
	
	sets.defense.PDT = { neck="Loricate Torque +1",ring1="Vocane Ring +1",
    ring2="Defending Ring"}

	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {}
	sets.engaged.DW = {}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {		
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Enki Strap",
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Ea Hat +1",
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Jhakri Pigaches +1",
		neck="Mizu. Kubikazari",
		waist="Hachirin-no-Obi",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Mujin Band",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
	
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}

	-- Weapons sets
	sets.weapons.Nehushtan = {main='Nehushtan',sub='Genmei Shield'}
	sets.weapons.DualWeapons = {main='Nehushtan',sub='Nehushtan'}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 5)
end

function sub_job_change(new,old)
send_command('wait 5;input /lockstyleset 20')
end

send_command('wait 5;input /lockstyleset 20')

send_command('exec init.txt')