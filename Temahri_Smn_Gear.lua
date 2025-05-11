-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Gridarvor','Khatvanga')

    gear.perp_staff = {name="Gridarvor"}
	
	gear.magic_jse_back = {name="Campestres's Cape",augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Eva.+20 /Mag. Eva.+20','Pet: "Regen"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape",augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Eva.+20 /Mag. Eva.+20','Pet: Haste+10',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book(1, 4)
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    -------------------
    --- Precast Sets---
    -------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    
    sets.precast.JA['Elemental Siphon'] = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Esper Stone +1",
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="",
        body="Telchine Chasuble",
		hands="Baayami Cuffs",
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Conveyance Cape",
		waist="Kobo Obi",
		legs="Telchine Braconi",
		feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",
		ammo="Sancus Sachet",
		head="Beckoner's Horn +1",
		neck="Incanter's Torque",
		ear1="Caller's Earring",
		ear2="Evans Earring",
        body="Con. Doublet +3",
		hands="Glyphic Bracers +1",
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1",
        back="Astute Cape",
		waist="Kobo Obi",
		legs="Beck. Spats +1",
		feet="Apogee Pumps"
}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Inyanga Jubbah +1",
		legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
		feet="Regal Pumps",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Kishar Ring",
		right_ring="Lebeche Ring",
		back="Perimede Cape",
}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})       
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Sancus Sachet",
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        body="Con. Doublet +3",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back="Conveyance Cape",waist="Luminary Sash",legs="Psycloth Lappas",feet="Beck. Pigaches +1"}

    
    -------------------
    --- Midcast sets---
    -------------------

    sets.midcast.FastRecast = {
		main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Inyanga Jubbah +2",hands="Volte Gloves",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Lengo Pants",feet="Regal Pumps +1"}
	
    sets.midcast.Cure = {
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Magnetic Earring",
		right_ear="",
		left_ring="Sirona's Ring",
		back="Tempered Cape +1",
}
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",	waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
		sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {
		neck="Debilis Medallion",
		hands="Hieros Mittens",
		ring1="Haoma's Ring",
		ring2="Menelaus's Ring",
		back="Tempered Cape +1",
		waist="Witful Belt"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	sets.midcast['Elemental Magic'] = {}
	sets.midcast['Elemental Magic'].Resistant = {}
    sets.midcast['Elemental Magic'].OccultAcumen = {}
	sets.midcast.Impact = {}
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})
    sets.midcast['Divine Magic'] = {}
	sets.midcast['Dark Magic'] = {}
	sets.midcast.Drain = {}
    sets.midcast.Aspir = sets.midcast.Drain
	sets.midcast.Stun = {}
	sets.midcast.Stun.Resistant = {}
	sets.midcast['Enfeebling Magic'] = {}
	sets.midcast['Enfeebling Magic'].Resistant = {}
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {
		ammo="Pemphredo Tathlum",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		ear2="",
		body="Anhur Robe",
		hands="Telchine Gloves",
		ring1="Stikini Ring +1",
		ring2="Stikini Ring +1",
		back="Perimede Cape",
		waist="Embla Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",
		sub="Genmei Shield",
		head="Amalric Coif +1",
		hands="Regal Cuffs",
		waist="Emphatikos Rope",
		legs="Shedir Seraweels"})
    
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		ear2="Earthcry Earring",
		waist="Siegel Sash",})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

	----------------------
    ---Avatar pact sets---
	----------------------
    
    sets.midcast.Pet.BloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",		
		ammo="Sancus Sachet",
		head="Beckoner's Horn +1",
		body="Call. Doublet +2",
		hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		legs="Beck. Spats +1",
		feet="",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		--right_ear="C. Palug Earring",
		left_ear="Lodurr Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back="Astute Cape"}

    sets.midcast.Pet.DebuffBloodPactWard = {
		main="Espiritus",
		sub="Vox Grip",	
		ammo="Sancus Sachet",
		head="Beckoner's Horn +1",
		body="Call. Doublet +2",
		hands={ name="Glyphic Bracers +1", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		legs="Beck. Spats +1",
		feet="",
		neck="Caller's Pendant",
		waist="Lucidity Sash",
		--right_ear="C. Palug Earring",
		left_ear="Lodurr Earring",
		right_ear="Andoaa Earring",
		left_ring="Evoker's Ring",
		right_ring="Stikini Ring +1",
		back="Astute Cape"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
		sub="Elan Strap",
		ammo="Sancus Sachet",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Apogee Mitts +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet="Convo. Pigaches +3",
		neck="Shulmanu Collar",
		waist="Incarnation Sash",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
}
		
    sets.midcast.Pet.PhysicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

    sets.midcast.Pet.MagicalBloodPactRage = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: STR+14','Pet: "Mag.Atk.Bns."+25','DMG:+18',}},
		sub="Elan Strap",
		ammo="Sancus Sachet",
		    head={ name="Apogee Crown +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Blood Pact Dmg.+7','Pet: DEX+9','Pet: Mag. Acc.+7',}},
		legs={ name="Enticer's Pants", augments={'MP+50','Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Mag. Acc.+15','Pet: Damage taken -5%',}},
		feet={ name="Apogee Pumps", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		neck="Adad Amulet",
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back="Astute Cape", -- Campestres's Cape: Pet: Macc/Mdmg
}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = {feet="Convo. Pigaches +3"}

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"
    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Flaming Crush'] = {
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
		sub="Elan Strap",
		ammo="Sancus Sachet",
		head={ name="Apogee Crown +1", augments={'MP+80','Pet: Attack+35','Blood Pact Dmg.+8',}}, --C. Palug Crown 
		body="Con. Doublet +3",
		hands="Apogee Mitts +1",
		legs={ name="Apogee Slacks", augments={'MP+60','Pet: "Mag.Atk.Bns."+30','Blood Pact Dmg.+7',}},
		feet="Convo. Pigaches +3",
		neck="Adad Amulet",
		waist="Regal Belt",
		left_ear="Gelos Earring",
		right_ear="Lugalbanda Earring",
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+10 Pet: Rng.Atk.+10',}},
		-- Campestres's Cape: Pet: Macc/Mdmg
}

		--C. Palug Ring for Acc
	sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    ---------------
    ---Idle Sets---
    ---------------
    
    -- Resting sets
    sets.resting = {
		head="Mirror Tiara",
		body="Shomonjijoe +1",
		hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +4',}},
		legs="Assid. Pants +1",
		neck="Grandiose Chain",
		waist="Fucho-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Relaxing Earring",
		left_ring="Varar Ring",
		right_ring="Defending Ring",
		back="Moonbeam Cape",
}
    
    -- Idle sets
    sets.idle = {
		main="Bolelabunga",
		sub="Genmei Shield",
        ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
        neck="Loricate Torque +1",
        lear="Gelos Earring",
        rear="Lugalbanda Earring",
        body="Shomonjijoe +1",
		hands="Apogee Mitts +1",
        lring="Vocane Ring +1",
        rring="Defending Ring",
        back="Moonbeam Cape",
        waist="Witful Belt",
        legs="Assid. Pants +1",
        feet="Convo. Pigaches +3"}

    sets.idle.PDT = {}
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})
    
    sets.idle.Avatar = {
		main="Gridarvor",
        sub="Elan Strap",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
        neck="Caller's Pendant",
        --lear="C. Palug Earring ",
        rear="Evans Earring",
        body="Apogee Dalmatica",
        hands="Glyphic Bracers +1",
        lring="Evoker's Ring",
        rring="Varar Ring",
        back="Campestres's cape",
        waist="Lucidity Sash",
        legs="Assid. Pants +1",
        feet="Apogee Pumps"
}
		
    sets.idle.PDT.Avatar = {
		main="Malignance Pole",
		sub="Oneiros Grip",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Evans Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Umbra Cape",
		waist="Regal Belt",
		legs="Assid. Pants +1",
		feet="Convo. Pigaches +3"}

    sets.idle.Spirit = {
		main="Gridarvor",
		sub="Oneiros Grip",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
		neck="Caller's Pendant",
		ear1="Etiolation Earring",
		ear2="Ethereal Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Evoker's Ring",
		ring2="Stikini Ring +1 +1",
        back="Conveyance Cape",
		waist="Lucidity Sash",
		legs="Assid. Pants +1",
		feet="Convo. Pigaches +3"}
		
    sets.idle.PDT.Spirit = {
		main="Malignance Pole",
		sub="Oneiros Grip",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ear2="Evans Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Umbra Cape",
		waist="Lucidity Sash",
		legs="Assid. Pants +1",
		feet="Battlecast Gaiters"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {neck="Chrys. Torque"})
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Gridavor, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {
		main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
		neck="Loricate Torque +1",
		ear1="Handler's Earring +1",
		ear2="Enmerkar Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Regal Belt",
		legs="Assid. Pants +1",
		feet="Baayami Sabots"}

    sets.defense.MDT = {
		main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Sancus Sachet",
        head="Beckoner's Horn +1",
		neck="Loricate Torque +1",
		ear1="Handler's Earring +1",
		ear2="Enmerkar Earring",
        body="Shomonjijoe +1",
		hands=gear.merlinic_refresh_hands,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonlight Cape",
		waist="Regal Belt",
		legs="Assid. Pants +1",
		feet="Baayami Sabots"}

    sets.defense.MEVA = {
		main="Malignance Pole",
		sub="Enki Strap",
		ammo="Sancus Sachet",
        head="Amalric Coif +1",
		neck="Warder's Charm +1",
		ear1="Sanare Earring",
		ear2="Lugalbanda Earring",
		body="Inyanga Jubbah +2",
		hands="Telchine Gloves",
		ring1="Vengeful Ring",
		Ring2="Purity Ring",
        back="Aurist's Cape +1",
		waist="Luminary Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"}
		
    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.HPDown = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}
    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Weapons sets
	sets.weapons.Gridarvor = {main="Gridarvor", sub="Elan Strap"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}

    ------------------
    ---Engaged sets---
    ------------------
    
	sets.engaged = {
		head="Tali'ah Turban +1",
		body="Tali'ah Manteel +1",
		hands="Tali'ah Gages +1",
		legs="Tali'ah Sera. +1",
		feet="Tali'ah Crackows +1",
		neck="Shulmanu Collar",
		waist="Windbuffet Belt +1",
		left_ear="Telos Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
		left_ring="Varar Ring",
		right_ring="Varar Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: "Regen"+10',}},
}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 4)
end