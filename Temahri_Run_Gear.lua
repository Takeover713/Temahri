function user_setup()

		--Erilaz = body > feet > legs > head > hands

	state.OffenseMode:options('Normal','SomeAcc','Acc')
	state.HybridMode:options('Tank','Normal','DTLite')
	state.WeaponskillMode:options('Normal','SomeAcc','Acc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank')
	state.Weapons:options('Epeolatry','Lionheart')
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	-- Additional local binds
	--send_command('bind !` gs c SubJobEnmity')
	-- ^ represents control- and ! is alt, eg !1 is alt-1 
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind !pause gs c toggle AutoBuffMode')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	--send_command('bind @f10 gs c toggle TankAutoDefense')

	send_command('exec init.txt')
	
	autows = 'Resolution'
	autowstp = 1250
	
	select_default_macro_book(1, 18)
end

function init_gear_sets()

	---------------
	-- Idle Sets --
	---------------

	sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Erilaz Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}
			
	sets.idle.Tank = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Warder's Charm +1",
		waist="Flume Belt +1",
		left_ear="Tuisto earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}
		
	sets.idle.KiteTank = {}

	sets.idle.Weak = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Warder's Charm +1",
		waist="Flume Belt +1",
		left_ear="Tuisto earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.resting = {}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +3",waist="Flume Belt"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Mensch Strap"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	
	-- Defense Sets
	
	sets.defense.PDT = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Warder's Charm +1",
		waist="Flume Belt +1", --Engraved Belt (Waking The Beast II)
		left_ear="Odnowa Earring +1",
		right_ear="Erilaz Earring +1",
		left_ring="Defending Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},
}
			
	sets.defense.MDT = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3", -- +3
		feet="Erilaz Greaves +3", 
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}

	sets.defense.BDT = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Warder's Charm +1",
		waist="Flume Belt +1",
		left_ear="Tuisto Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}
	
	sets.defense.MEVA = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Gelatinous Ring +1",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10',}},
}
		
	sets.defense.Death = set_combine(sets.defense.PDT, {})
	sets.defense.DTCharm = set_combine(sets.defense.PDT, {})
	sets.defense.Charm = set_combine(sets.defense.PDT, {})
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	------------------
	-- Engaged sets --
	------------------

    sets.engaged = {
		ammo="Aurgelmir Orb +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Nyame Sollerets",
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's Cape", augments={'STR+18','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
    sets.engaged.SomeAcc = {}
	sets.engaged.Acc = {}

    sets.engaged.DTLite = {		
	    ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Nyame Mail",
		hands={ name="Adhemar Wrist. +1", augments={'STR+12','DEX+12','Attack+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear="Sherida Earring",
		left_ring="Chirich Ring +1",
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

    sets.engaged.SomeAcc.DTLite = {}
	sets.engaged.Acc.DTLite = {}
	
    sets.engaged.Tank = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Erilaz Surcoat +3",
		hands="Erilaz Gauntlets +3",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Warder's Charm +1",
		waist="Flume Belt +1", --Engraved Belt (Waking The Beast II)
		left_ear="Odnowa Earring +1",
		right_ear="Erilaz Earring +1",
		left_ring="Defending Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}},
}

    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	
	----------------------
	-- Weaponskill sets --
	----------------------
	
	sets.precast.WS = {   --Resolution
		ammo="Ginsen",  --Coiste Bodhar - Odyssey (Gogmagog)
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Eponas Ring",
		back={ name="Ogma's Cape", augments={'STR+18','Accuracy+20 Attack+20','Weapon skill damage +10%',}}, --STR30
}
	sets.precast.WS.SomeAcc = {}	
	sets.precast.WS.Acc = {}
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})

    sets.precast.WS['Dimidiation'] = {
		ammo="Jukukik Feather", --Coiste Bodhar - Odyssey (Gogmagog)
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Ramuh Ring +1", --Regal Ring (Ou)
		right_ring="Niqmaddu Ring",
		back={ name="Ogma's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})
	
	------------
	-- Enmity --
	------------
	
	sets.Enmity = {
		ammo="Staunch Tathlum +1",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Unmoving Collar +1", --Lustreless Scale (DEF +30 HP +200)
		waist="Warwolf Belt",
		left_ear="Cryptic Earring",
		right_ear="Odnowa Earring +1", --Lustreless Hide (DEF +30 Damage Taken -3%)
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}, --HP +80, PDT -10%
}

    sets.Enmity.DT = {
		ammo="Staunch Tathlum +1",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Kurys Gloves",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Unmoving Collar +1", --Lustreless Scale (DEF +30 HP +200)
		waist="Warwolf Belt",
		left_ear="Cryptic Earring",
		right_ear="Odnowa Earring +1", --Lustreless Hide (DEF +30 Damage Taken -3%)
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}, --HP +80, Enmity +10, PDT -10%
}
		 
    sets.Enmity.SIRD = {
		ammo="Staunch Tathlum +1",
		head="Erilaz Galea +3",
		body="Nyame Mail",
		hands="Regal Gauntlets",
		legs="Eri. Leg Guards +3",
		feet="Erilaz Greaves +3",
		neck="Unmoving Collar +1", --Moonlight necklace SIR 15% (NQ 10%)
		waist="Audumbla Sash",
		left_ear="Magnetic Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Evanescence Ring",
		right_ring="Gelatinous Ring +1", --Lustreless Scale (VIT +15, HP +100)
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}, --HP +80, Enmity +10, SIR -10%
}

	------------------
	-- Precast Sets --
	------------------
	
	    sets.precast.JA['Lunge'] = {
		ammo="Seething Bomblet",
		head="Ayanmo Zucchetto +1",
		body="Cohort Cloak +1", --Lustreless Hide (Stats +20, MAB/MAcc +100)
		hands="Agwu's Gages",
		legs="Agwu's Slops",
		feet="Agwu's Pigaches",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Locus Ring",
		right_ring="Mujin Band",
		back="Evasionist's Cape", --Ogma's cape (INT, MAB, etc)
}

    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist Coat +3",legs="Futhark Trousers +1",back={ name="Ogma's Cape", augments={'INT+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
	sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.enmity, {back="Evasionist's Cape"})
	sets.precast.JA['Vivacious Pulse'] = set_combine(sets.enmity, {head="Erilaz Galea +3",legs="Runeist Trousers ",})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})
    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +3"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +3"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +3",neck="Incanter's Torque",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	-------------
	-- FC Sets --
	-------------
	
    sets.precast.FC = {
		ammo="Sapience Orb",
		head="Runeist Bandeau +3",
		body="Erilaz Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
			
	sets.precast.FC.DT = {
		ammo="Sapience Orb",
		head="Runeist Bandeau +3",
		body="Erilaz Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {	
		waist="Siegel Sash",
		legs="Futhark Trousers +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
})
	
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	------------------
	-- Midcast sets --
	------------------
	
    sets.midcast.FastRecast = {
		ammo="Sapience Orb",
		head="Runeist Bandeau +3",
		body="Erilaz Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}, --HP +80, FC +10%, PDT -10%
}
			
	sets.midcast.FastRecast.DT = {
		ammo="Sapience Orb",
		head="Runeist Bandeau +3",
		body="Erilaz Surcoat +3",
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="Futhark Trousers +1", augments={'Enhances "Inspire" effect',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck="Voltsurge Torque",
		waist="Isa Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Parrying rate+5%',}}, --HP +80, FC +10%, PDT -10%
}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		waist="Siegel Sash",
		legs="Futhark Trousers +1",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
})
    
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		head="Fu. Bandeau +3",
		hands="Regal Gauntlets",})
    
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		hands="Stone Mufflers",
		ear1="Earthcry Earring",
		waist="Siegel Sash"})
		
	sets.midcast.Cure = {
		head="Nyame Helm",
		body="Nyame Mail",
		feet="Erilaz Greaves +3",
		neck="Colossus's Torque",
		waist="Olympus Sash",
		left_ear="Cryptic Earring",
}
		
	sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Runeist Bandeau +3"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +3"}) 	
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

 --Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'BLU' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 18)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 18)
	else
		set_macro_page(1, 18)
	end
end

function sub_job_change(new,old)
send_command('wait 2;input /lockstyleset 17')
end

send_command('wait 2;input /lockstyleset 17')

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	When='Always'},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	When='Always'},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	When='Always'},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	When='Always'},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		When='Always'},
	},

	Default = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
	},
	
	Full = {
		{Name='Crusade',	Buff='Enmity Boost',	SpellID=476,	Reapply=false},
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
	Melee = {
		{Name='Temper',		Buff='Multi Strikes',	SpellID=493,	Reapply=false},
		{Name='Haste',		Buff='Haste',			SpellID=57,		Reapply=false},
		{Name='Refresh',	Buff='Refresh',			SpellID=109,	Reapply=false},
		{Name='Aquaveil',	Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Stoneskin',	Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',		Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Phalanx',	Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Regen IV',	Buff='Regen',			SpellID=477,	Reapply=false},
	},
}