function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'Refresh', 'PDT', 'MDT','Aminon')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Naegling','BlackHalo','Sequence','Odin','BH')
	
	autows_list = {['Naegling']='Savage Blade',['BlackHalo']='Black Halo',['Sequence']='Requiescat',['BH']='Black Halo'}
	autowstp = 1250

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	--send_command('bind != input /ja "Penury" <me>')
	--send_command('bind @= input /ja "Parsimony" <me>')
	--send_command('bind ^delete input /ja "Dark Arts" <me>')
	--send_command('bind !delete input /ja "Addendum: Black" <me>')
	--send_command('bind @delete input /ja "Manifestation" <me>')
	--send_command('bind ^\\\\ input /ma "Protect V" <t>')
	--send_command('bind @\\\\ input /ma "Shell V" <t>')
	--send_command('bind !\\\\ input /ma "Reraise" <me>')
	--send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book(1, 3)
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Weapons sets
	sets.weapons.Sequence = {main="Sequence",sub="Thibron"}
	sets.weapons.Odin = {main="Qutrub Knife",sub="Ceremonial Dagger"}
	sets.weapons.Naegling = {main="Naegling",sub="Thibron"}	-- sub="Tauret"
	sets.weapons.BlackHalo = {main="Maxentius", sub="Thibron"}
	sets.weapons.BH = {main="Maxentius", sub="Genmei Shield"}
	sets.WakeUpWeapons = {main="Prime Sword"}
	
	-- Idle sets
	
	sets.idle = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Homiliary",
		head="Viti. Chapeau +3",
		body="Lethargy Sayon +3",
		hands="Malignance Gloves",   	--Malignance Gloves
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring +1",
		back="Solemnity Cape",
}
	sets.idle.Aminon = {main="Maxentius",--sub="Sacro Bulwark",
		range=empty,ammo="Staunch Tathlum +1",
		head="Null Masque",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		--body="Bunzi's Robe",
		hands="Bunzi's Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back="Null Shawl",waist="Null Belt",legs="Bunzi's Pants",feet="Bunzi's Sabots"}
	-- sets.idle = {
		-- main="Daybreak",
		-- sub="Genmei Shield",
		-- ammo="Staunch Tathlum +1",
		-- head="Malignance Chapeau",
		-- body="Malignance Tabard",
		-- hands="Vitiation Gloves +1",   	--Malignance Gloves
		-- legs="Malignance Tights",
		-- feet="Malignance Boots",
		-- neck="Loricate Torque +1",
		-- waist="Fucho-no-Obi",
		-- left_ear="Hearty Earring",
		-- right_ear="Etiolation Earring",
		-- left_ring="Defending Ring",
		-- right_ring="Vocane Ring +1",
		-- back="Solemnity Cape",
-- }

	-- sets.idle = {
        -- main="Daybreak",
		-- sub="Genmei Shield",
		-- ammo="Homiliary",
		-- head="Viti. Chapeau +3",
		-- body="Lethargy Sayon +3",
		-- hands=gear.Chironic_R_hands,
		-- legs={ name="Chironic Hose", augments={'"Fast Cast"+2','INT+5','"Refresh"+1','Accuracy+20 Attack+20','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
		-- feet={ name="Chironic Slippers", augments={'INT+5','"Repair" potency +5%','"Refresh"+1',}},
		-- neck="Loricate Torque +1",
		-- waist="Plat. Mog. Belt",
		-- left_ear="Etiolation Earring",
		-- right_ear="Ethereal Earring",
		-- left_ring="Defending Ring",
        -- right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		-- back=gear.RDM_MND_Cape,
        -- }

sets.idle.Refresh = {
		main="Daybreak",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Fucho-no-Obi",
		left_ear="Hearty Earring",
		right_ear="Etiolation Earring",
		left_ring="Defending Ring",
		right_ring="Vocane Ring +1",
		back="Solemnity Cape",
}
		
	sets.idle.PDT = {}	
	sets.idle.MDT = {}	
	sets.idle.Weak = {}
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})
	
	-- Precast Sets
	organizer_items = {}
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +1"}
	

	sets.precast.Step = {ammo="Hasty Pinion +1",
		head="Malignance Chapeau",neck="Null Loop",ear1="Zennaroi Earring",ear2="Crepuscular Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Cacoethic Ring +1",ring2="Chirich Ring +1",
		back="Null Shawl",waist="Null Belt",legs="Malignance Tights",feet="Malignance Boots"}
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub={ name="Beatific Shield +1", augments={'Phys. dmg. taken -3%','HP+30 MP+30','Magic dmg. taken -3%',}},
		ammo="Sapience Orb",
		head="Atro. Chapeau +2",
		body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
		hands="Leyline Gloves",
		legs="Psycloth Lappas",
		feet="Amalric Nails",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Malignance Earring",
		right_ear="Leth. Earring +1",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Occ. inc. resist. to stat. ailments+10',}},
}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Crepuscular Cloak"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. houseaux +3",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Seraph Blade'] =     {
		ammo="Sroda Tathlum",
		head="Leth. Chappel +3",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Jhakri Cuffs +2",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		neck="Sanctity Necklace",
		waist="Eschan Stone", -- orpheus's sash aman trove
		left_ear="Regal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Epaminondas's Ring",
		right_ring="Freke Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}}, --need to make a int with WSD cape
}
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",ear1="Moonshade Earring",ring1="Begrudging Ring",waist="Fotia Belt",feet="Thereoid Greaves"})

	sets.precast.WS['Savage Blade'] = {    
		ammo="Coiste Bodhar",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Leth. houseaux +3",
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring", -- sroda ring
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['Black Halo'] = set_combine(sets.precast.WS['Savage Blade'], {
 		ear2="Sherida Earring",
		})
		
	sets.precast.WS['Sanguine Blade'] =  {
		ammo="Sroda Tathlum",
		head="Pixie Hairpin +1",
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Jhakri Cuffs +2",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		neck="Sanctity Necklace", -- baetyl pendant from warder of love escha ruan
		waist="Eschan Stone", -- orpheus's sash aman trove
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Fenrir Ring +1", -- archon ring from arch dynamis lord
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
		--back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}}, need to make this cape for this ws.
}
	
	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. houseaux +3",
    neck="Sibyl Scarf",
    waist="Acuity Belt +1",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
	back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
    --back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
	}
	
	-- sets.midcast['Elemental Magic'] = {
        -- main="Bunzi's Rod",
		-- sub="Ammurapi Shield",
        -- ammo="Ghastly Tathlum +1",
        -- head="Leth. Chappel +2",
        -- body="Lethargy Sayon +3",
        -- hands="Leth. Ganth. +3",
        -- legs="Leth. Fuseau +3",
        -- feet="Leth. houseaux +3",
        -- neck="Sibyl Scarf",
        -- ear1="Malignance Earring",
        -- ear2="Regal Earring",
		-- ring1="Metamor. Ring +1",
        -- ring2="Medada's Ring",
        -- back=gear.RDM_INT_Cape,
        -- waist="Acuity Belt +1",
        -- }
		
	sets.midcast.Impact = { 
		--main="Maxentius",
		--sub="Ammurapi Shield",
		ammo="Regal Gem",
		--range="Ullr",
		neck="Null Loop",
		ear1="Malignance Earring",
		ear2="Snotra Earring",
		body="Crepuscular Cloak",
		hands="Leth. Ganth. +3",
		ring1="Metamor. Ring +1",
		ring2="Stikini Ring +1",
		back="Null Shawl",
		waist="Null Belt",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3"}
		
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Amalric Gages +1",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	-- Gear for specific elemental nukes.


	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Medium's Sabots"}

    sets.midcast.Cure = {
		main="Daybreak",
		sub="Sors Shield",
		ammo="Regal Gem",
		head="Vanya Hood",
		body="Vanya Robe",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Atrophy Tights +1",
		feet="Vanya Clogs",
		neck="Incanter's Torque",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Magnetic Earring",
		left_ring="Stikini Ring +1",
		right_ring="Sirona's Ring",
		back="Tempered Cape +1",
}
		
    --sets.midcast.LightWeatherCure = {
--	main="Chatoyant Staff",
--	sub="Curatio Grip",
--    ammo="Regal Gem",
--    head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
--    body="Vanya Robe",
--    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
--    legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
--    feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
--    neck="Colossus's Torque",
--    waist="Hachirin-no-Obi"
--    left_ear="Regal Earring",
--    right_ear="Magnetic Earring",
--    left_ring="Stikini Ring +1",
--    right_ring="Sirona's Ring",
--    back="Tempered Cape +1",
--}
		
		--Cureset for if it's not light weather but is light day.
 --   sets.midcast.LightDayCure = {
--	main="Chatoyant Staff",
--	sub="Curatio Grip",
    --ammo="Regal Gem",
    --head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
    --body="Vanya Robe",
    --hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    --legs={ name="Chironic Hose", augments={'Mag. Acc.+24','Haste+1','MND+14','"Mag.Atk.Bns."+11',}},
    --feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
    ---neck="Colossus's Torque",
    --waist="Hachirin-no-Obi"
    --left_ear="Regal Earring",
    --right_ear="Magnetic Earring",
    --left_ring="Stikini Ring +1",
    --right_ring="Sirona's Ring",
    --back="Tempered Cape +1",
--s}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",hands="Hieros Mittens",
		ring1="Haoma's Ring",ring2="Haoma's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Oranyan",sub="Clemency Grip"})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {neck="Phalaina Locket",ear1="Etiolation Earring",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {
		main="Pukulatmuj +1", -- +1 it
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body="Vitiation Tabard +1",
		hands="Viti. Gloves +1", --Bastok
		legs="Telchine Braconi", 
		feet="Leth. Houseaux +3", --Abys Feet
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+2','Enh. Mag. eff. dur. +19',}},
}


--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works//
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	
	sets.midcast.Refresh = {body="Atrophy Tabard +2",legs="Leth. Fuseau +3"}
	sets.midcast.Aquaveil = {hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	sets.midcast.BoostStat = {hands="Vitiation Gloves +3"}
	
	sets.midcast['Temper II'] = {
		main="Pukulatmuj +1", -- +1 it
		sub="Pukulatmuj",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body="Vitiation Tabard +1",
		hands="Viti. Gloves +1", --bastok
		legs="Telchine Braconi", 
		feet="Leth. Houseaux +3", --Abys Feet
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+2','Enh. Mag. eff. dur. +19',}},
}

    sets.midcast.Enspell = {
		main="Pukulatmuj +1", -- +1 it
		sub="Pukulatmuj",
		ammo="Staunch Tathlum +1",
		head="Befouled Crown",
		body="Vitiation Tabard +1",
		hands="Viti. Gloves +1", --bastok
		--legs="Telchine Braconi",
		legs="Carmine Cuisses +1",
		feet="Leth. Houseaux +3", --Abys Feet
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Embla Sash",
		left_ear="Andoaa Earring",
		right_ear="Mimir Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +10','Enha.mag. skill +4','Mag. Acc.+2','Enh. Mag. eff. dur. +19',}},
}
	
	sets.midcast['Enfeebling Magic'] = {
		main="Daybreak",
		sub="ammurapi shield",
		ammo="Regal Gem",
		head="Vitiation Chapeau +3",
		body="Lethargy Sayon +3", 
		hands="Leth. Ganth. +3",
		legs="Chironic Hose",
		feet="Vitiation Boots +3",
		neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Snotra Earring",
		right_ear="Regal Earring",
		--left_ring="Kishar Ring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
		
	sets.midcast['Enfeebling Magic'].Resistant = {
		main="Daybreak",
		sub="ammurapi shield",
		ammo="Regal Gem",
		head="Vitiation Chapeau +3",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Chironic Hose",
		feet="Vitiation Boots +3",
		neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Snotra Earring",
		right_ear="Regal Earring",
		--left_ring="Kishar Ring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
		}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {hands=gear.chironic_enfeeble_hands})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt"})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Viti. Chapeau +3",waist="Chaac Belt",feet=gear.chironic_treasure_feet})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
    sets.midcast['Elemental Magic'] = {
		main="Bunzi's Rod",
		sub="Ammurapi Shield",
		ammo="Ghastly Tathlum +1",
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
		feet="Leth. houseaux +3",
		neck="Sanctity Necklace",
		waist="Acuity Belt +1",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Freke Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

	-- sets.midcast['Elemental Magic'] = {
        -- main="Bunzi's Rod",
		-- sub="Ammurapi Shield",
        -- ammo="Ghastly Tathlum +1",
        -- head="Leth. Chappel +2",
        -- body="Lethargy Sayon +3",
        -- hands="Leth. Ganth. +3",
        -- legs="Leth. Fuseau +3",
        -- feet="Leth. houseaux +3",
        -- neck="Sibyl Scarf",
        -- ear1="Malignance Earring",
        -- ear2="Regal Earring",
		-- ring1="Metamor. Ring +1",
        -- ring2="Medada's Ring",
        -- back=gear.RDM_INT_Cape,
        -- waist="Acuity Belt +1",
        -- }
		
    sets.midcast['Elemental Magic'].Resistant = {}	
    sets.midcast['Elemental Magic'].Fodder = {}
    sets.midcast['Elemental Magic'].Proc = {}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {})

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Amalric Coif +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
		body="Atrophy Tabard +2",hands="Leth. Ganth. +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Sucellos's Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet=gear.merlinic_nuke_feet}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Regal Gem",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Regal Earring",ear2="Digni. Earring",
        body=gear.merlinic_nuke_body,hands=gear.chironic_enfeeble_hands,ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet=gear.chironic_nuke_feet}

	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast['Absorb-TP'] = {
	-- main="Maxentius",
	-- sub="Ammurapi Shield",
		ammo="Regal Gem",
        head="Null Masque",neck="Null Loop",ear1="Malignance Earring",ear2="Leth. Earring +1",
        body="Viti. Tabard +3",hands="Leth. Ganth. +3",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast['Absorb-TP'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",ammo=empty,
        head="Atrophy Chapeau +3",neck="Null Loop",ear1="Malignance Earring",ear2="Leth. Earring +1",
        body="Lethargy Sayon +3",hands="Leth. Ganth. +3",ring1="Stikini Ring +1",ring2="Metamor. Ring +1",
        back="Null Shawl",waist="Null Belt",legs="Leth. Fuseau +3",feet="Leth. Houseaux +3"}
		
	sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Sucellos's Cape",waist="Witful Belt",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Stun.Resistant = {main="Serenity",sub="Enki Strap",ammo="Regal Gem",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Zendik Robe",hands="Gende. Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Bolelabunga",sub="Genmei Shield",ammo="Impatiens",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
		back="Umbra Cape",waist="Flume Belt",legs="Lengo Pants",feet=gear.chironic_refresh_feet}

	
	-- Defense sets
	sets.defense.PDT = {}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {}
		
    sets.defense.MEVA = {}
		
	sets.idle.TPEat = set_combine(sets.idle, {})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
}

	sets.engaged.DW = {
	-- main="Qutrub Knife",
    -- sub="Ceremonial Dagger",
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    --hands="Aya. Manopolas +2", use for oding only maybe? 
	hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10',}},
}
		
	sets.engaged.Enspell = {
	-- main="Qutrub Knife",
    -- sub="Ceremonial Dagger",
    ammo="Coiste Bodhar",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Null Loop",
    --waist="Orpheus's Sash",
	waist="Reiki Yotai",
    left_ear="Sherida Earring",
    right_ear="Balder Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}
		
		
	sets.engaged.PhysicalDef = {}
		
	sets.engaged.MagicalDef = {}

end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
    set_macro_page(1, 3)
end

function sub_job_change(new,old)
send_command('wait 6;input /lockstyleset 20')
end

send_command('wait 6;input /lockstyleset 20')

send_command('exec init.txt')

buff_spell_lists = {
	Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		{Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		{Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	},
	
	AutoMelee = {
		{Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		{Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
	},
	
	Default = {
		{Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	},

	MageBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	FullMeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},
	
	MeleeBuff = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		{Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	},

	Odin = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	},
	
	Tolba = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		{Name='Enblizzard',		Buff='Enblizzard',		SpellID=104,	Reapply=false},
		{Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		{Name='Barwater',		Buff='Barwater',		SpellID=65,		Reapply=false},
	},
	
	HybridCleave = {
		{Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		{Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		{Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		{Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		{Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		{Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		{Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		{Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	}}




-- buff_spell_lists = {
	-- Auto = {--Options for When are: Always, Engaged, Idle, OutOfCombat, Combat
		-- {Name='Refresh III',	Buff='Refresh',		SpellID=894,	When='Always'},
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	When='Always'},
		-- {Name='Aurorastorm',	Buff='Aurorastorm',	SpellID=119,	When='Idle'},
		-- {Name='Reraise',		Buff='Reraise',		SpellID=135,	When='Always'},
	-- },
	
	-- AutoMelee = {
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	When='Engaged'},
		-- {Name='Temper II',		Buff='Multi Strikes',SpellID=895,	When='Engaged'},
	-- },
	
	-- Default = {
		-- {Name='Refresh III',	Buff='Refresh',		SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',		SpellID=511,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',	SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',		SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',		SpellID=47,		Reapply=false},
	-- },

	-- MageBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- },
	
	-- FullMeleeBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Aquaveil',		Buff='Aquaveil',		SpellID=55,		Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Blink',			Buff='Blink',			SpellID=53,		Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		-- {Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Barfire',		Buff='Barfire',			SpellID=60,		Reapply=false},
		-- {Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	-- },
	
	-- MeleeBuff = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Shock Spikes',	Buff='Shock Spikes',	SpellID=251,	Reapply=false},
		-- {Name='Enthunder',		Buff='Enthunder',		SpellID=104,	Reapply=false},
		-- {Name='Barblizzard',	Buff='Barblizzard',		SpellID=61,		Reapply=false},
		-- {Name='Barparalyze',	Buff='Barparalyze',		SpellID=74,		Reapply=false},
	-- },

	-- Odin = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Enaero',			Buff='Enaero',			SpellID=102,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- },
	
	-- Tolba = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-STR',		Buff='STR Boost',		SpellID=486,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Regen II',		Buff='Regen',			SpellID=110,	Reapply=false},
		-- {Name='Enblizzard',		Buff='Enblizzard',		SpellID=104,	Reapply=false},
		-- {Name='Stoneskin',		Buff='Stoneskin',		SpellID=54,		Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
		-- {Name='Barwater',		Buff='Barwater',		SpellID=65,		Reapply=false},
	-- },
	
	-- HybridCleave = {
		-- {Name='Refresh III',	Buff='Refresh',			SpellID=894,	Reapply=false},
		-- {Name='Haste II',		Buff='Haste',			SpellID=511,	Reapply=false},
		-- {Name='Phalanx',		Buff='Phalanx',			SpellID=106,	Reapply=false},
		-- {Name='Gain-INT',		Buff='INT Boost',		SpellID=490,	Reapply=false},
		-- {Name='Enthunder II',	Buff='Enthunder II',	SpellID=316,	Reapply=false},
		-- {Name='Temper II',		Buff='Multi Strikes',	SpellID=895,	Reapply=false},
		-- {Name='Shell V',		Buff='Shell',			SpellID=52,		Reapply=false},
		-- {Name='Protect V',		Buff='Protect',			SpellID=47,		Reapply=false},
	-- }}