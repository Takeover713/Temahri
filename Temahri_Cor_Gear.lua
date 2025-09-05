-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Leaden','Naegling','NaeglingDW','LastStand','Absorb','AeolianWeapons','Trials')
	state.CompensatorMode:options('Always','300','1000','Never')
	
	--	AF Body Relic Body,Hands,Feet --Empy Head,Hands,Legs(acc),Feet
	--	Tauret Pulse weapon
	--	Death Penalty
	--  Atakos https://www.bg-wiki.com/ffxi/Category:Trial_of_the_Magians_Marksmanship
	
	
    gear.RAbullet = "Chrono Bullet" -- Bronze Bullet
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here. Orichalc. Bullet
    gear.QDbullet = "Living Bullet"
    options.ammo_warning_limit = 15

	send_command('exec init.txt')
	
	autows_list = {['Leaden']='Leaden Salute',['Naegling']='Savage Blade',['NaeglingDW']='Savage Blade',['LastStand']='Last Stand',['AeolianWeapons']='Aeolian Edge'}
	autowstp = 1250

    -- Additional local binds
	send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

----To Upgrade----
----------------------------------------------------------
--AF -Laksamana's 

--Frac +2	P. COR Card x15	Kyou's Scale	Niobium Ingot, Cypress Lumber,Cyan Orb x3
-----------------------------------------------------------
--Relic -Lanun

--Body +2	Torsoshard: COR x2	Voidtorso: COR x2	Hades' Claw x2	Lanun Frac +3

--Feet +1	Footshard: COR x2	Azure Leaf	Rockfin Tooth x1		Lanun Bottes +2
--Bottes +2	Footshard: COR x2	Voidfoot: COR x2	Plovid Flesh x2	Lanun Bottes +3
-----------------------------------------------------------
--Empy

--ALL

    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.Leaden = {main="Naegling",sub="Nusku Shield",range="Death Penalty"}
	sets.weapons.Naegling = {main="Naegling",sub="Nusku Shield",range="Ataktos"}
	sets.weapons.NaeglingDW = {main="Naegling",sub="Gleti's Knife",range="Ataktos"}
	sets.weapons.Absorb = {main="Naegling",sub="Nusku Shield",range=empty}
	sets.weapons.AeolianWeapons = {main="Blurred Knife +1",sub="Hep. Rapier +1",range="Ataktos"}
	sets.weapons.LastStand = {main={ name="Rostam", augments={'Path: A',}},sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.Trials = {main="Seika Uchiwa",sub="Nusku Shield",range="Anarchy"}

    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {
		ammo=gear.RAbullet,
		head="Null Masque",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Carmine Cuisses +1",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Null Belt",
		left_ear="Tuisto Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring="Vocane Ring +1",
		back="Moonbeam Cape",
}
		
    sets.idle.Refresh = {}
    
    -- Defense sets
    sets.defense.PDT = {}
    sets.defense.MDT = {}
    sets.defense.MEVA = {}
    sets.Kiting = {legs="Carmine Cuisses +1",feet="Hermes' Sandals +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {ear1="Dudgeon Earring",ear2="Heartseeker Earring",body="Adhemar Jacket +1",hands="Floral Gauntlets",waist="Reiki Yotai"}
	
	--main={name="Rostam", bag="Wardrobe 2"},
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Chasseur's Culottes +1", 
		feet="Malignance Boots",
		--neck="Combatant's Torque",
		neck="Iskur Gorget",
		waist="Reiki Yotai",
		left_ear="Telos Earring",
		right_ear="Suppanomimi",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
    
    sets.engaged.Acc = {}
    sets.engaged.DW = {}
    sets.engaged.DW.Acc = {}
	sets.engaged.DT = {}
	sets.engaged.DW.DT = {}
	
	-- Ranged gear
    
	sets.midcast.RA = {
		ammo=gear.RAbullet,
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		--waist="Yemaya Belt", --Duke Vepar
		left_ear="Telos Earring",
		right_ear="Enervating Earring",
		left_ring="Dingir Ring",
		right_ring="Ilabrat Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
}

    sets.midcast.RA.Acc = {}
		
	sets.buff['Triple Shot'] = {
		body="Chasseur's Frac +2", --Empy, sortie
		hands="Lanun Gants +1", --Relic, bastok (done)
		head="Oshosi Mask +1", --AH
		legs="Osh. Trousers +1", --AH
		feet="Osh. Leggings +1", --AH
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
}

    -- Precast Sets
	
	sets.precast.RA = {
		ammo=gear.RAbullet,
        head="Chass. Tricorne +2", 
		--neck="Commodore Charm +2", --AH
        body="Laksa. Frac +2", --AF, Omen
		hands="Lanun Gants +1", --Bastok (Done)
		left_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'INT+20','"Snapshot"+10',}},
		waist="Yemaya Belt",
		legs="Adhemar Kecks +1", --Jovian Legs
		feet="Meg. Jam. +2", --Slip 23
}

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac +2"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +1"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +1"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +1"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +1"}
    
	sets.precast.CorsairRoll = {
		main={ name="Rostam", augments={'Path: C',}},
		range="Compensator",
		head="Lanun Tricorne +1", --Dynamis, Windy
		neck="Regal Necklace",
		hands="Chasseur's Gants +2", --Empy, Sortie
		back={ name="Camulus's Mantle", augments={'INT+20','"Snapshot"+10',}},
		feet="Malignance Boots",
}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
	sets.precast.CorsairRoll["Bolter's Roll"] = {neck="Regal Necklace",}
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes +1"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes +1"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +2"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +2"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +2"})
    
    sets.precast.CorsairShot = {
		ammo=gear.QDbullet,
		--head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Dbl.Atk."+1','MND+7','"Mag.Atk.Bns."+15',}},
		body="Lanun Frac +1", 
		--hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		--legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Crit. hit damage +3%','"Mag.Atk.Bns."+4',}},
		feet="Chass. Bottes +1", --Empy, Sortie
		neck="Baetyl Pendant", --Warder of Love
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Fenrir Ring +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
		
	sets.precast.CorsairShot.Damage = set_combine(sets.precast.CorsairShot, {})
    sets.precast.CorsairShot.Proc = set_combine(sets.precast.CorsairShot, {})
    sets.precast.CorsairShot['Light Shot'] =  set_combine(sets.precast.CorsairShot, {})
    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		waist="Flume Belt +1",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Moonbeam Cape",
}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		--left_ring="Sroda Ring", --20M
		right_ring="Ephramad's Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
		
    sets.precast.WS.Acc = {}		
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Aeolian Edge'] = {}
	sets.precast.WS['Circle Blade'] = {}
	
	
	--Ephramad's Ring instead of regal ring, crepuscular knife, nyame helm r15, nyame legs r15, 
	sets.precast.WS['Savage Blade'] = {
		ammo=gear.WSbullet,
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands="Chasseur's Gants +2",
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		--left_ring="Sroda Ring", --20M
		right_ring="Ephramad's Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS['Savage Blade'], {})
    sets.precast.WS['Last Stand'] = {}
    sets.precast.WS['Last Stand'].Acc = {}
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    -- Hachirin-no-Obi
	sets.precast.WS['Leaden Salute'] = {
		ammo=gear.MAbullet,
		head="Pixie Hairpin +1",
		body="Lanun Frac +1",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Lanun Bottes +1",
		--neck="Commodore Charm +2", --AH
		waist="Eschan Stone",
		left_ear="Moonshade Earring",
		right_ear="Friomisi Earring",
		left_ring="Dingir Ring",
		--right_ring="Archon Ring", --Arch DL
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
} 

    sets.precast.WS['Leaden Salute'].Acc = set_combine(sets.precast.WS['Leaden Salute'], {})
    sets.precast.WS['Wildfire'] = {}
    sets.precast.WS['Wildfire'].Acc = {}
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",
		neck="Baetyl Pendant",
		ear1="Enchntr. Earring +1",
		ear2="Loquacious Earring",
        body="Dread Jupon",
		hands="Leyline Gloves",
		ring1="Kishar Ring",
		ring2="Lebeche Ring",
        back="Moonlight Cape",
		waist="Flume Belt",
		legs="Rawhide Trousers",
		feet="Carmine Greaves +1"}
		
        
    -- Specific spells

	sets.midcast['Absorb-TP'] = {
		ammo="Pemphredo Tathlum",
		head="Null Masque",
		body="Chasseur's Frac +2",
		hands="Chasseur's Gants +2",
		legs="Chas. Culottes +1",
		feet="Chass. Bottes +1",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Digni. Earring",
		right_ear="Chas. Earring +1",
		left_ring="Stikini Ring +1",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Null Shawl",
}

    sets.midcast.Utsusemi = sets.midcast.FastRecast

end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 20)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 20)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 20)
    else
        set_macro_page(1, 20)
    end   


end


function sub_job_change(new,old)
send_command('wait 8;input /lockstyleset 20')
end

send_command('wait 8;input /lockstyleset 20')