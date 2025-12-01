function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc')
	state.HybridMode:options('Normal','DT','PDT','MDT')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc')
    state.CastingMode:options('Normal','Resistant','Proc')
    state.IdleMode:options('Normal','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('TizonaSeq','MagicWeapons','Naegling','MeleeClubs')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	--send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')

	select_default_macro_book(1, 17)
end

function init_gear_sets()

	-- Weapons sets
	sets.weapons.TizonaSeq = {main="Tizona",sub="Sequence"}
	sets.weapons.MagicWeapons = {main="Nibiru Cudgel",sub="Nibiru Cudgel"}
	sets.weapons.Naegling = {main="Naegling",sub="Thibron"}
	sets.weapons.MeleeClubs = {main="Maxentius",sub="Thibron"}
	
	---------------
	-- Idle sets --
	---------------
	
	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Hashishin Tayt +3",
		feet="Malignance Boots",
		neck="Bathy Choker +1",
		waist="Null Belt",
		left_ear="Eabani Earring",
		right_ear="Genmei Earring",
		left_ring="Vocane Ring +1",
		right_ring="Murky Ring",
		back="Null Shawl",
}

	sets.idle.PDT = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Hashishin Tayt +3",
		feet="Malignance Boots",
		neck="Bathy Choker +1",
		waist="Null Belt",
		left_ear="Eabani Earring",
		right_ear="Genmei Earring",
		left_ring="Vocane Ring +1",
		right_ring="Murky Ring",
		back="Null Shawl",
}

	-- Defense sets
	sets.defense.PDT = {}
	sets.defense.MDT = {}
    sets.defense.MEVA = {}
	sets.Kiting = {legs="Carmine Cuisses +1"}

	------------------
	-- Engaged sets --
	------------------

	sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Murky Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

	sets.engaged.AM = {
		ammo="Aurgelmir Orb +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Murky Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}

	sets.engaged.SomeAcc = {}
	sets.engaged.SomeAcc.AM = {}
	sets.engaged.Acc = {}
	sets.engaged.Acc.AM = {}

	sets.engaged.DT = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Hashishin Tayt +3",
		feet="Malignance Boots",
		neck="Bathy Choker +1",
		waist="Null Belt",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		right_ring="Vocane Ring +1",
		right_ring="Murky Ring",
		back="Null Shawl"
}

	sets.engaged.DT.AM = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Hashishin Tayt +3",
		feet="Malignance Boots",
		neck="Bathy Choker +1",
		waist="Null Belt",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		right_ring="Vocane Ring +1",
		right_ring="Murky Ring",
		back="Null Shawl"
}

	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.DTLite = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.DTLite = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	
	----------------------
	-- Weaponskill sets --
	----------------------

	sets.precast.WS = {
		ammo="Crepuscular pebble",
		head="Hashishin Kavuk +3",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		legs="Gleti's Breeches",
		feet="Nyame Sollerets",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS.Acc = {}

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Crepuscular pebble",
		head="Hashishin Kavuk +3",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		legs="Gleti's Breeches",
		feet="Nyame Sollerets",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {
		ammo="Crepuscular pebble",
		head="Hashishin Kavuk +3",
		body="Gleti's Cuirass",
		hands="Nyame Gauntlets",
		legs="Gleti's Breeches",
		feet="Nyame Sollerets",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Sroda Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
})
	
	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
		ammo="Aurgelmir Orb +1",
		head={ name="Adhemar Bonnet", augments={'STR+10','DEX+10','Attack+15',}},
		body="Gleti's Cuirass",
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Fotia Belt",
		right_ear="Odr Earring",
		left_ear="Moonshade Earring", --"Mache Earring +1"
		left_ring="Begrudging Ring", 
		right_ring="Epona's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
})

	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
		ammo="Aurgelmir Orb +1",
		head="Luhlaza Keffiyeh +2",	
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Gleti's Breeches",
		feet="Luhlaza Charuqs +4",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}, --*Rosmerta’s should be augmented with MND, Attack, and Double Attack.
})

	sets.precast.WS['Sanguine Blade'] = {
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body=="Nyame Mail",
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Nyame Sollerets",
		neck="Sibyl Scarf",
		waist="Fotia Belt",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="SArchon Ring",
		right_ring="Epaminondas's Ring",
		back="Cornflower Cape", --*Rosmerta's {'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}}
}

	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",back=gear.wsd_jse_back,legs="Carmine Cuisses +1",feet=gear.herculean_wsd_feet})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {ear2="Moonshade Earring",ring2="Begrudging Ring",body="Sayadio's Kaftan",back=gear.crit_jse_back,legs="Carmine Cuisses +1"})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {head="Jhakri Coronal +2",ear1="Regal Earring",body="Jhakri Robe +2",ring2="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {head="Jhakri Coronal +2",ear1="Regal Earring",ear2="Telos Earring",ring1="Rufescent Ring",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"})
	sets.precast.WS['Vorpal Blade'] = set_combine(sets.precast.WS, {head="Adhemar Bonnet +1",ear1="Cessance Earring", ear2="Brutal Earring",ring2="Begrudging Ring",back=gear.crit_jse_back,feet="Thereoid Greaves"})
	sets.precast.WS['Vorpal Blade'].Acc = set_combine(sets.precast.WS.Acc, {back=gear.crit_jse_back})
	sets.precast.WS['Flash Nova'] = {}

	------------------
	-- Precast Sets --
	------------------
	
	sets.precast.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}

	-- Fast cast sets for spells

	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Herculean Helm", augments={'"Triple Atk."+3','VIT+1','Accuracy+13',}},
		--body="Taeon Tabard",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape",
}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket"})
	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin Mintan +1"})

	------------------
	-- Midcast Sets --
	------------------
	
	sets.midcast.FastRecast = {
		ammo="Sapience Orb",
		head="Carmine Mask +1",
		body="Helios Jacket",
		hands="Leyline Gloves",
		legs="Psycloth Lappas",
		feet="Carmine Greaves +1",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		ear1="Etiolation Earring",
		ear2="Loquacious Earring",
		ring1="Kishar Ring",
		ring2="Prolix Ring",
		back="Perimede Cape",
}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {
		ammo="Aurgelmir Orb +1",
		head="Luhlaza Keffiyeh +2",
		body={ name="Herculean Vest", augments={'Pet: Attack+16 Pet: Rng.Atk.+16','Pet: Phys. dmg. taken -3%','Pet: "Mag.Atk.Bns."+14',}},
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}}, --"Luh. Bazubands +3",
		legs="Hashishin Tayts +3",
		feet="Luhlaza Charuqs +4",
		neck={ name="Mirage Stole +2", augments={'Path: A',}},
		waist="Warwolf Belt", --"Prosilio Belt +1"??
		left_ear="Odnowa Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Ifrit Ring +1",
		right_ring="Petrov Ring",
		--back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		back={ name="Cornflower Cape", augments={'MP+25','DEX+3','Accuracy+3','Blue Magic skill +10',}},
}

	sets.midcast['Blue Magic'].Physical.Resistant = {}
	sets.midcast['Blue Magic'].Physical.Fodder = {}
	sets.midcast['Blue Magic'].PhysicalAcc = {}
	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder
	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})
	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {
		ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet=" Hashi. Basmak +3",
		neck="Sibyl Scarf",
		--waist="Fotia Belt",
		left_ear="Friomisi Earring",
		right_ear="Regal Earring",
		left_ring="Shiva Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+6','"Mag.Atk.Bns."+10',}},
}
 
	sets.midcast['Blue Magic'].Magical.Proc = {}
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].Magical.Fodder = {}
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {ring1="Stikini Ring +1",ring2="Stikini Ring +1"})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {}

	sets.midcast['Enfeebling Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Dark Magic'] = {
    ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +2",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Hachirin-no-obi",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+6','"Mag.Atk.Bns."+10',}},
}

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Hachirin-no-obi",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+6','"Mag.Atk.Bns."+10',}},
}

	sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +1",
		neck="Sanctity Necklace",
		waist="Hachirin-no-obi",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+6','"Mag.Atk.Bns."+10',}},
}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {}

	sets.midcast.Cure = {
    ammo="Hydrocera",
    head="Carmine Mask",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +2",
    legs="Jhakri Slops +2",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Luminary Sash",
    left_ear="Hecate's Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Haoma's Ring",
    back="Solemnity Cape",
}

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {
    ammo="Mavi Tathlum",
	head="Luhlaza Keffiyeh +2",
    body="Assim. Jubbah +3",
    hands="Jhakri Cuffs +2", --"Luh. Bazubands +3"
    legs="Hashishin Tayt +3",
    feet="Luhlaza Charuqs +4",
    neck="Mirage Stole +2",
    waist="Hachirin-no-obi",
    left_ear="Regal Earring",
    right_ear="Digni. Earring",
    left_ring="Shiva Ring +1", --"Kunaji Ring"
    right_ring="Shiva Ring +1", --"Meridian Ring"
	back="Cornflower Cape",
}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {
    ammo="Pemphredo Tathlum",
	head="Hashishin Kavuk +3",
	body="Hashishin Mintan +3",
	hands="Hashi. Bazu. +3",
	legs="Hashishin Tayt +3",
	feet="Hashi. Basmak +3",
    neck="Null Loop",
    waist="Null Belt",
	left_ear="Regal Earring",
	right_ear="Digni. Earring",
    left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
    back="Cornflower Cape",
}

	sets.midcast['Blue Magic'].Stun.Resistant = {}
	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic']['White Wind'] = {
		ammo="Staunch Tathlum", --ammo="Falcon Eye",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		--head="Carmine Mask +1",
		body="Hashishin Mintan +1",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		neck="Unmoving Collar +1",
		waist="Luminary Sash",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Vocane Ring +1",
		back="Tempered Cape +1", --"Moonlight Cape",
}
					
	sets.midcast['Blue Magic']['Healing Breeze'] = sets.midcast['Blue Magic']['White Wind']

	sets.midcast['Blue Magic'].Healing = {  
		ammo="Staunch Tathlum",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
		body="Hashishin Mintan +1",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+13',}},
		feet={ name="Amalric Nails", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
		neck="Unmoving Collar +1",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Mendi. Earring",
		left_ring="Haoma's Ring",
		right_ring="Vocane Ring +1",
		back="Solemnity Cape",
}

	sets.midcast['Blue Magic']['Cruel Joke'] = {
		ammo="Ghastly Tathlum +1",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet=" Hashi. Basmak +3",
		neck="Sibyl Scarf",
		waist="Null Belt",
		left_ear="Digni. Earring",
		right_ear="Hashi. Earring +1",
		left_ring="Metamor. Ring +1",
		right_ring="Medada's Ring",
		back="Null Shawl"}

	sets.midcast['Blue Magic']['Absolute Terror'] = {
		ammo="Ghastly Tathlum +1",
		head="Hashishin Kavuk +3",
		body="Hashishin Mintan +3",
		hands="Hashi. Bazu. +3",
		legs="Hashishin Tayt +3",
		feet=" Hashi. Basmak +3",
		neck="Sibyl Scarf",
		waist="Null Belt",
		left_ear="Digni. Earring",
		right_ear="Hashi. Earring +1",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Medada's Ring",
		back="Null Shawl"
}
		
	--Overwrite certain spells with these peices even if the day matches, because of resource inconsistancies.
	sets.NonElementalCure = {back="Tempered Cape +1",waist="Luminary Sash"}

	sets.midcast['Blue Magic'].SkillBasedBuff = {    
		ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +2",
		body="Assim. Jubbah +3",
		hands="Hashi. Bazu. +3", --"Rawhide Gloves",
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +4",
		neck="Mirage Stole +2",
		waist="Witful Belt",
		left_ear="Etiolation Earring", --"Njordr Earring",
		right_ear="Hashi. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Cornflower Cape",
}

	sets.midcast['Blue Magic'].Buff = {
		ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh +2",
		neck="Mirage Stole +2",
		ear1="Gifted Earring",
		ear2="Hashishin Earring +1",
		body="Assim. Jubbah +3",
		hands="Rawhide Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Cornflower Cape",
		waist="Witful Belt",
		legs="Hashishin Tayt +3",
		feet="Luhlaza Charuqs +4"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Cessance Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Regal Earring",ear2="Telos Earring"}

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Assim. Bazu. +3"} --Only have Lv.75 NQ

	-- Resting sets
	sets.resting = {}


    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {waist="Flume Belt",ear1="Suppanomimi", ear2="Ethereal Earring"}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
	sets.DWEarrings = {ear1="Dudgeon Earring",ear2="Heartseeker Earring"}
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",waist="Reiki Yotai",legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Assault = {ring1="Balrahn's Ring"}

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",legs="Gyve Trousers",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Locus Ring"}

	sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +1"}
	sets.buff['Chain Affinity'] = {feet="Assim. Charuqs +2"}
	sets.buff.Convergence = {head="Luh. Keffiyeh +1"}
	sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {back=gear.da_jse_back,legs="Hashishin Tayt +1"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.HPDown = {}

end

 --Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 17)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 17)
	else
		set_macro_page(1, 17)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()

				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.chat.input('/ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.chat.input('/ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.chat.input('/ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.chat.input('/ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.chat.input('/ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 16')
end

send_command('wait 2;input /lockstyleset 16')