function user_job_setup()

    -- Options: Override default values	
	state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Tank','DDTank','Normal')
    state.WeaponskillMode:options('Match','Normal', 'Acc')
    state.CastingMode:options('SIRD','Normal')
	state.Passive:options('None','AbsorbMP')
    state.PhysicalDefenseMode:options('PDT_HP','PDT','PDT_Reraise')
    state.MagicalDefenseMode:options('MDT_HP','MDT','MDT_Reraise')
	state.ResistDefenseMode:options('MEVA_HP','MEVA')
	state.IdleMode:options('Tank','Normal','Aminon')
	state.Weapons:options('BurtgangSrivatsa','BurtgangAegis','BurtgangOchain','Naegling')
	
    state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP','Twilight'}
	
	gear.fastcast_jse_back = {name="Rudianos's Mantle",augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10',}}
	gear.enmity_jse_back = {name="Rudianos's Mantle",augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind ^backspace input /ja "Shield Bash" <t>')
	send_command('bind @backspace input /ja "Cover" <stpt>')
	send_command('bind !backspace input /ja "Sentinel" <me>')
	send_command('bind @= input /ja "Chivalry" <me>')
	send_command('bind != input /ja "Palisade" <me>')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
    send_command('bind !f11 gs c cycle ExtraDefenseMode')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^pause gs c toggle AutoRuneMode')
	send_command('bind ^q gs c set IdleMode Kiting')
	send_command('bind !q gs c set IdleMode PDT')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	send_command('exec init.txt')
	
	autows = 'Atonement'
	autowstp = 1500
	
	autofood = 'Miso Ramen +1'
	
    select_default_macro_book()
    update_defense_mode()
end

--AF		Gallant > Reverence
--Head:	No		Middling HP+ & Enmity+. Cover has lost a lot of use so the duration effect isn't likely to change anything. Fully upgraded +3 isn't worth the cost outside of completionist circles.	
--Body:	Yes		Major piece with high upgrade value. Massive HP+ swap piece with a significant amount of Fast Cast and Damage Taken-% attached.
--Hands: Yes	Moderately high HP+ and middling Enmity+. Shield Mastery +2 effect won't move the needle much. Fully upgraded +3 isn't worth the cost outside of completionist circles.
--Legs:	Yes		Still a major HP+ swap piece with the highest HP for this slot. Physical Damage Taken -% is still fairly high and helps balance out sets when swapping in accessories or gear with HP+ augments is a pain on the higher end of the spectrum.
--Feet:	Yes		Provides one of the largest chunks of shield skill for a shield block build; significant Damage Taken to MP conversion (Your Mileage May Vary); as well as extending Holy circle's duration to four and half minutes and augmenting its damage reduction & damage multiplier effects. Niche but still significant.

---------------

--Relic		Valor > Caballarius
--Head:	Yes		Worth it just for the Rampart duration alone. HP+ and Enmity+ are bonuses. Iron Will augment is only active while worn.
--Body:	Yes		High HP+, Damage Taken-%, and Enmity+. While Cover may not see as much use, the damage conversion is still noticeable. Fealty Duration is also a significant gain when it is available.
--Hands: Yes	Significant HP+ and matching Enmity+ with other sources. Augment increases TP to MP conversion of Chivalry. Worth it just for transforming Shield Bash into a highly accurate non-elemental dispel.
--Legs:	YMMV	A middle of the road all-round piece. Upgrade discretion up to the player, but keep it around and upgrade at your leisure. Augment extends Invincible by 10 seconds.
--Feet:	Yes		Low to average HP+ and Enmity+ compared to other sources. Worth upgrading just for augmenting and extending Sentinel window. Make it and embrace it.

---------------

--Empy		Creed > Chevalier's (Kukulkan's Fang)
--Head:	Yes!	Moderate HP+, Fast Cast+%, Shield Skill+, and Converts Physical Damage to MP with significant Damage Taken-%.
--Body:	Yes		Moderately high HP+ and significant Spell Interruption Rate Down+%. Tying the damage taken-% stat to the player's enmity is both a gift and a curse.
--Hands: Maybe	Low HP+. Lacks Enmity but significant damage taken-%. Rare stat of Shield Defense Bonus+.
--Legs:	Yes!	Moderate HP+ and high damage taken-%. Adds rare stat of Enmity Retention +12.
--Feet:	Yes		Low HP+ but moderately high Enmity+ as well as Fast Cast compared to other sources. Worth it just for Divine Emblem+ enhancement.


--------------

--Ambu Capes:
--Rudianos's Mantle - 	HP+60, Eva.+20 /Mag. Eva.+20, Mag. Evasion+10, Enmity+10, Phys. dmg. taken-10%
						--HP+60','Eva.+20 /Mag. Eva.+20, Mag. Evasion+10, "Fast Cast"+10, Phys. dmg. taken-10%
						--'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%'
						--'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%'

function init_gear_sets()

		-- Weapons sets
	sets.weapons.BurtgangOchain = {main="Burtgang",sub="Ochain"}
	sets.weapons.BurtgangAegis = {main="Burtgang",sub="Aegis"}
	sets.weapons.BurtgangSrivatsa = {main="Burtgang",sub="Srivatsa"}
	sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	
	-----------------------------------
	-- Idle/resting/defense/etc sets --
	-----------------------------------

    -- Idle sets
    sets.idle = {
		ammo="Staunch Tathlum +1",
		head="Null Masque",
		body="Nyame Mail", --body="Sakpata's Plate",
		hands="Nyame Gauntlets", --hands="Sakpata's Gauntlets",
		legs="Nyame Flanchard", --legs="Sakpata's Cuisses",
		feet="Nyame Sollerets", --feet="Sakpata's Leggings",
		neck="Warder's Charm +1",
		waist="Flume Belt +1", --waist="Carrier's Sash", Legion...
		left_ear="Odnowa Earring +1",
		right_ear="Alabaster Earring", --right_ear="Chev. Earring +2", Sortie
		left_ring="Murky Ring",
		right_ring="Vocane Ring +1",
		back="Moonbeam Cape",
}
	
	--sets.idle.Aminon = {
		--ammo="Vanir Battery", --The Celestial Nexus II
		--head="Null Masque",
		--body="Makora Meikogai", --Pazuzu, Zi-Tah
		--hands="Nyame Gauntlets",,
		--legs="Nyame Flanchard",
		--feet="Nyame Sollerets",
		--neck="Coatl Gorget +1",
		--waist="Carrier's Sash",
		--left_ear="Odnowa Earring +1",
		--right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		--left_ring="Vexer Ring +1", --AH
		--right_ring="Apeile Ring +1", --Immanibugard, Lustreless Scale
		--back="Null Shawl",
--}

    sets.idle.PDT = {}
    sets.idle.Block = {}
    sets.idle.MDT = {}

	sets.idle.Tank = {
		ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Warder's Charm +1",
		waist="Flume Belt +1", --waist="Carrier's Sash",
		left_ear="Odnowa Earring +1", --Check R15?? Lustreless Hide
		--right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Murky Ring",--left_ring="Moonlight Ring",
		right_ring="Vocane Ring +1", --right_ring="Moonlight Ring",
		--back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}
		
	sets.idle.Kiting = {}
	sets.resting = {}

	sets.Kiting = {legs="Carmine Cuisses +1"}

	--sets.latent_refresh = {waist="Fucho-no-obi"}
	--sets.latent_refresh_grip = {sub="Oneiros Grip"}
	--sets.latent_regen = {ring1="Apeile Ring",ring2="Apeile Ring +1"}
	--sets.DayIdle = {}
	--sets.NightIdle = {}

	--------------------------------------
    -- Defense sets
    --------------------------------------
    
    -- Extra defense sets.  Apply these on top of melee or defense sets.
	sets.Knockback = {}
    sets.MP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +1"}
	sets.passive.AbsorbMP = {head="Chev. Armet +1",neck="Coatl Gorget +1",ear2="Ethereal Earring",waist="Flume Belt +1",feet="Rev. Leggings +1"}
    sets.MP_Knockback = {}
    sets.Twilight = {head="Crepuscular Helm", body="Crepuscular Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
    
    sets.defense.Block = {}
	sets.defense.PDT = {}		
    sets.defense.PDT_HP = {}		
	sets.defense.MDT = {}		
    sets.defense.MDT_HP = {}
	sets.defense.MEVA = {}		
    sets.defense.MEVA_HP = {}
	sets.defense.PDT_Reraise = set_combine(sets.defense.PDT_HP,{head="Crepuscular Helm",body="Crepuscular Mail"})
    sets.defense.MDT_Reraise = set_combine(sets.defense.MDT_HP,{head="Crepuscular Helm",body="Crepuscular Mail"})
		
	--------------------------------------
	-- Engaged sets
	--------------------------------------
    
	sets.engaged = {
		ammo="Staunch Tathlum +1",
		--head="Sakpata's Helm",
		--body="Sakpata's Plate",
		--hands="Sakpata's Gauntlets",
		--legs="Sakpata's Cuisses",
		--feet="Sakpata's Leggings",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Warder's Charm +1",
		waist="Plat. Mog. Belt",
		left_ear="Odnowa Earring +1",
		right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}

    sets.engaged.Acc = {}
    sets.engaged.DW = {}
    sets.engaged.DW.Acc = {}

	sets.engaged.Tank = {
		ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Warder's Charm +1",
		waist="Plat. Mog. Belt",
		left_ear="Odnowa Earring +1",
		right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Murky Ring", --Moonlight Ring
		right_ring="Vocane Ring +1",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}
		
	sets.engaged.DDTank = {}
	sets.engaged.Acc.DDTank = {}
	sets.engaged.NoShellTank = {}
    sets.engaged.Reraise = set_combine(sets.engaged.Tank, sets.Reraise)
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc.Tank, sets.Reraise)
	
	--------------------------------------
	-- Precast sets
	--------------------------------------
	
    sets.Enmity = {
		ammo="Staunch Tathlum +1", --ammo="Sapience Orb", --Umdhlebi - Zi-Tah
		head="Loess Barbuta +1", --Hidhaegg, Lustreless Wing
		body="Chev. Cuirass +3", --Empy
		hands="Regal Gauntlets",
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, --Bushin Abjuration
		feet="Chev. Sabatons +1", --Empy
		neck="Unmoving Collar +1", --Lustreless Scale (DEF +30 HP +200) --neck="Moonlight Necklace",
		waist="Warwolf Belt", --waist="Creed Baudrier", --Ironclad Executioner, Aby - Vunk
		left_ear="Odnowa Earring +1",
		right_ear="Cryptic Earring",
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}
		
    sets.Enmity.SIRD = {
		ammo="Staunch Tathlum +1",
		--head="Loess Barbuta +1", Hidhaegg
		body="Chev. Cuirass +3", --Empy
    	hands="Regal Gauntlets",
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}}, --August, SR
		feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}, --Dazzling Dolores
		neck="Unmoving Collar +1", --neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Cryptic Earring",
		lleft_ring="Evanescence Ring",
		right_ring="Murky Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}
	
    sets.Enmity.DT = {
		ammo="Staunch Tathlum +1", --ammo="Sapience Orb", --Umdhlebi - Zi-Tah
		--head="Loess Barbuta +1", Hidhaegg
		body="Rev. Surcoat +3", --AF
		hands="Regal Gauntlets",
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}}, --August, SR
		feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}, --Dazzling Dolores
		neck="Unmoving Collar +1", --neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Cryptic Earring",
		left_ring="Supershear Ring",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},	
}
		
    -- Precast sets to enhance JAs
    sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{head="Cab. Coronet +1"}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
    sets.precast.JA['Invincible'].DT = set_combine(sets.Enmity.DT,{legs="Cab. Breeches +1"})
    sets.precast.JA['Holy Circle'].DT = set_combine(sets.Enmity.DT,{feet="Rev. Leggings +1"})
    sets.precast.JA['Sentinel'].DT = set_combine(sets.Enmity.DT,{feet="Cab. Leggings +1"})
    sets.precast.JA['Rampart'].DT = set_combine(sets.Enmity.DT,{head="Cab. Coronet +1"}) --head="Valor Coronet" (Also Vit?)
    sets.precast.JA['Fealty'].DT = set_combine(sets.Enmity.DT,{body="Cab. Surcoat +1"})
    sets.precast.JA['Divine Emblem'].DT = set_combine(sets.Enmity.DT,{feet="Chev. Sabatons +1"})
    sets.precast.JA['Cover'].DT = set_combine(sets.Enmity.DT, {body="Cab. Surcoat +1"}) --head="Rev. Coronet +1",
	
    -- add mnd for Chivalry
    sets.precast.JA['Chivalry'] = {
		ammo="Paeapua",
		head="Nyame Helm",
		neck="Unmoving Collar +1",
		ear1="Nourish. Earring",
		ear2="Nourish. Earring +1",
		body="Rev. Surcoat +3",
		hands="Cab. Gauntlets +1",
		ring1="Stikini Ring +1",
		ring2="Rufescent Ring",
		back=gear.enmity_jse_back,
		waist="Luminary Sash",
		legs="Nyame Flanchard",
		feet="Carmine Greaves +1"}
		
    sets.precast.JA['Chivalry'].DT = {ammo="Paeapua",
		head="Nyame Helm",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Rev. Surcoat +3",hands="Cab. Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonlight Cape",waist="Luminary Sash",legs="Nyame Flanchard",feet="Carmine Greaves +1"}

	sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity, {
		ammo="Staunch Tathlum +1", --ammo="Sapience Orb", --Umdhlebi - Zi-Tah
		--head="Loess Barbuta +1", Hidhaegg
		--Bushin Abjuration: Body / body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}}, --Relic
		--Bushin Abjuration / legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--Bushin Abjuration / feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar +1", --neck="Moonlight Necklace",
		waist="Creed Baudrier",
		left_ear="Odnowa Earring +1",
		right_ear="Erilaz Earring +1",
		left_ring="Murky Ring", --Moonlight Ring?
		right_ring="Vocane Ring +1",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
})

    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Palisade'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Intervene'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	
	sets.precast.JA['Shield Bash'].DT = set_combine(sets.Enmity.DT, {
		ammo="Staunch Tathlum +1", --ammo="Sapience Orb", --Umdhlebi - Zi-Tah
		--head="Loess Barbuta +1", Hidhaegg
		--Bushin Abjuration: Body / body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--hands={ name="Cab. Gauntlets +3", augments={'Enhances "Chivalry" effect',}}, --Relic
		--Bushin Abjuration / legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--Bushin Abjuration / feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Unmoving Collar +1", --neck="Moonlight Necklace",
		waist="Creed Baudrier",
		left_ear="Odnowa Earring +1",
		right_ear="Erilaz Earring +1",
		left_ring="Murky Ring", --Moonlight Ring?
		right_ring="Vocane Ring +1",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
})

	
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Palisade'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Intervene'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
    
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    -- Fast cast sets for spells
    
    sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --Shinryu Abjuration: Head
		body="Rev. Surcoat +3", --AF
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		--legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}}, --Tangata Manu - Zi-Tah
		feet="Chev. Sabatons +3", --Empy
		neck="Voltsurge Torque",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
	
		
    sets.precast.FC.DT = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --Shinryu Abjuration: Head
		body="Rev. Surcoat +3", --AF
		hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		--legs={ name="Eschite Cuisses", augments={'"Mag.Atk.Bns."+25','"Conserve MP"+6','"Fast Cast"+5',}}, --Tangata Manu - Zi-Tah
		feet="Chev. Sabatons +3", --Empy
		neck="Voltsurge Torque",
		waist="Plat. Mog. Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {}) -- waist="Siegel Sash"
	sets.precast.FC['Enhancing Magic'].DT = set_combine(sets.precast.FC.DT, {}) -- waist="Siegel Sash"
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {}) -- neck="Diemer Gorget",ear2="Nourish. Earring"
  
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		--ammo="Ginsen", --ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Fotia Belt", --waist="Sailfi Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		--right_ring="Gelatinous Ring +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},	
}
		
    sets.precast.WS.DT = {
		--ammo="Ginsen", --ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Fotia Belt", --waist="Sailfi Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		--right_ring="Gelatinous Ring +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},	
}

    sets.precast.WS.Acc = {
		--ammo="Ginsen", --ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Fotia Belt", --waist="Sailfi Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Thrud Earring",
		left_ring="Epaminondas's Ring",
		--right_ring="Gelatinous Ring +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},	
}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Thrud Earring", --?? Maybe have
		left_ring="Epaminondas's Ring",
		--right_ring="Gelatinous Ring +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
})

    sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {
		ammo="Crepuscular Pebble",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Rep. Plat. Medal",
		waist="Sailfi Belt +1",
		left_ear="Odnowa Earring +1",
		right_ear="Thrud Earring", --?? Maybe have
		left_ring="Epaminondas's Ring",
		--right_ring="Gelatinous Ring +1",
		back={ name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
})
	
			--R15
	-- ammo="Crepuscular Pebble",
    -- head="Sakpata's Helm",
    -- neck="Kgt. Beads +2",
    -- ear1="Tuisto Earring",
    -- ear2="Thrud Earring",
    -- body="Sakpata's Plate",
    -- hands="Sakpata's Gauntlets",
    -- ring1="Cornelia's Ring",
    -- ring2="Gelatinous Ring +1",
    -- back="Rudianos's Mantle",
    -- waist="Sailfi Belt +1",
    -- legs="Sakpata's Cuisses",
    -- feet="Sulev. Leggings +2"
			
			--R30
	-- ammo="Crepuscular Pebble",
    -- head="Nyame Helm",
    -- neck="Kgt. Beads +2",
    -- ear1="Tuisto Earring",
    -- ear2="Thrud Earring",
    -- body="Nyame Mail",
    -- hands="Nyame Gauntlets",,
    -- ring1="Cornelia's Ring",
    -- ring2="Gelatinous Ring +1",
    -- back="Rudianos's Mantle",
    -- waist="Sailfi Belt +1",
    -- legs="Nyame Flanchard",
    -- feet="Nyame Sollerets"
	
	
	sets.precast.WS['Flat Blade'] = {}

    sets.precast.WS['Sanguine Blade'] = {
	ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Thrud Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back="Moonbeam Cape",
}
		

    sets.precast.WS['Atonement'] = {
		ammo="Sapience Orb",
		head="Loess Barbuta +1",
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		feet={ name="Eschite Greaves", augments={'HP+80','Enmity+7','Phys. dmg. taken -4',}},
		neck="Moonlight Necklace",
		waist="Fotia Belt",
		left_ear="Odnowa Earring +1",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Vexer Ring +1",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}},
}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}


	------------------
	-- Midcast sets --
	------------------

    sets.midcast.FastRecast = {}
	sets.midcast.FastRecast.DT = {}
    sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.SIRD = set_combine(sets.Enmity.SIRD, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {
		ammo="Sapience Orb",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body="Sakpata's Plate",
		hands={ name="Macabre Gaunt. +1", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Sacro Gorget",
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Moonlight Ring",
		right_ring="Vocane Ring +1",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
	}
	
--Egoist's Tathlum
--Loess Barbuta +1
--Enm+10, DT-10%, All Attr.+10
--Souv. Cuirass +1
--HP+105, Enm.+9, Cure Rec.+15%
--Macabre Gaunt. +1
--M.Eva+75, Resist All+10, All Attr.+10
--Souv. Diechlings +1
--HP+105, Enm.+9, Cure Rec.+15%
--Chev. Sabatons +3
--Sacro Gorget
--Tuisto Earring
--Cryptic Earring
--Vexer Ring +1
--Eihwaz Ring
--Creed Baudrier
--Rudianos's Mantle
--HP+60, M.Eva/Eva+20, M.Eva+10, Cure Pot.+10%, PDT-10%

		
		
    sets.midcast.Cure.SIRD = {
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--hands="Macabre Gaunt. +1",
		hands="Regal Gauntlets",
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
		feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Tuisto Earring",
		right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Gelatinous Ring +1",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
	}
		
--Staunch Tathlum +1
--Souv. Schaller +1
--HP+105, Enm.+9, Cure Rec.+15%
--Souv. Cuirass +1
--HP+105, Enm.+9, Cure Rec.+15%
--Macabre Gaunt. +1
--M.Eva+75, Resist All+10, All Attr.+10
--Founder's Hose
--Odyssean Greaves
--Cure Pot. +4~6%
--Moonlight Necklace
--Tuisto Earring
--Nourish. Earring +1
--Gelatinous Ring +1
--VIT+15, HP+100
--Eihwaz Ring
--Audumbla Sash
--Rudianos's Mantle
--HP+60, M.Eva/Eva+20, M.Eva+10, Cure Pot.+10%, PDT-10%

		
		
    sets.midcast.Cure.DT = {
		ammo="Staunch Tathlum +1",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		--hands="Macabre Gaunt. +1",
		hands="Regal Gauntlets",
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
		feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Tuisto Earring",
		--right_ear="Chev. Earring +2",
		--left_ring="Gelatinous Ring +1",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
}
		
    sets.midcast.Reprisal = {
		ammo="Sapience Orb",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		body="Rev. Surcoat +3", -- shabti Cuirass +1 if i want to add duration but not ilvl 119 so maybe i dont want that
		hands="Regal Gauntlets",
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
		feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Cryptic Earring",
		left_ring="Gelatinous Ring +1",
		right_ring="Moonlight Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Phys. dmg. taken-10%',}},
}

--Priwen
--HP+50, M.Eva+50, DT-3%
--Sapience Orb
--Carmine Mask +1
--Acc/M.Acc+20/12, FC+4%
--Shab. Cuirass +1
--Souv. Handsch. +1
--HP+105, Enm.+9, Cure Rec.+15%
--Souv. Diechlings +1
--HP +105, Enm. +9, Cure Rec. +15%
--Eschite Greaves
--HP+80, PDT-4%, Enmity+7
--Moonlight Necklace
--Trux Earring
--Cryptic Earring
--Supershear Ring
--Eihwaz Ring
--Creed Baudrier
--Rudianos's Mantle - HP+60, Eva/M.Eva+20, FC+10%, M.Eva+10, PDT-10%


	sets.Self_Healing = {
		ammo="Sapience Orb",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body="Sakpata's Plate",
		hands={ name="Macabre Gaunt. +1", augments={'Path: A',}},
		legs={ name="Sakpata's Cuisses", augments={'Path: A',}},
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Sacro Gorget",
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
		left_ring="Moonlight Ring",
		--right_ring="Vengeful Ring",
		right_ring="Eihwaz Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
}
		
	sets.Self_Healing.SIRD = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    --hands="Macabre Gaunt. +1",
	hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Gelatinous Ring +1",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
	}
	
		
	sets.Self_Healing.DT = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    --hands="Macabre Gaunt. +1",
	hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet={ name="Odyssean Greaves", augments={'"Fast Cast"+4','Mag. Acc.+15','"Mag.Atk.Bns."+11',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Tuisto Earring",
    right_ear={ name="Chev. Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+16','Mag. Acc.+16','Damage taken-6%','STR+7 VIT+7',}},
    left_ring="Gelatinous Ring +1",
    right_ring="Eihwaz Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Cure" potency +10%','Phys. dmg. taken-10%',}},
	}

	sets.Cure_Received = {hands="Souv. Handsch. +1",feet="Souveran Schuhs +1"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

    sets.midcast['Enhancing Magic'] = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Sakpata's Plate", -- need to dark matter augments on odyssean chestplate
   -- hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}, -- need to dark matter augments on odyssean greaves
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear="Mimir Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+5','Phalanx +3',}},}
		
    sets.midcast['Enhancing Magic'].SIRD = {
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Sakpata's Plate", -- need to dark matter augments on odyssean chestplate
    --hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
	feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}}, -- need to dark matter augments on odyssean greaves
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear="Mimir Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+5','Phalanx +3',}},}
	
	-- sets.midcast['Enlight II'] = {
	-- ammo="Staunch Tathlum +1",
    -- head="Jumalik Helm",
    -- neck="Moonlight Necklace",
    -- ear2="Knightly Earring",
    -- ear1="Odnowa Earring +1",
    -- body="Rev. Surcoat +3",
    -- hands="Eschite Gauntlets",
    -- ring1="Gelatinous Ring +1",
    -- ring2="Defending Ring",
    -- back="Moonlight Cape",
    -- waist="Asklepian Belt",
    -- legs="Founder's Hose",
    -- feet="Odyssean Greaves"
	-- }

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {
		main="Sakpata's Sword", 
		Sub="Priwen",
		ammo="Sapience Orb",
    --head={ name="Odyssean Helm", augments={'Accuracy+21','Weapon skill damage +5%','STR+10','Attack+10',}}, dark matter augments phalanx +5
		head="Sakpata's Helm",
		body={ name="Odyss. Chestplate", augments={'"Drain" and "Aspir" potency +1','Pet: Phys. dmg. taken -2%','Phalanx +2','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="Sakpata's Cuisses",
		feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    --neck="Unmoving Collar +1",
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Odnowa Earring +1",
		right_ear="Mimir Earring",
		left_ring="Moonlight Ring",
		right_ring="Moonlight Ring",
		back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+5','Phalanx +3',}},
	})
	sets.midcast.Phalanx.SIRD = set_combine(sets.midcast['Enhancing Magic'].SIRD, {
	main="Sakpata's Sword", 
	Sub="Priwen",
	ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Odyss. Chestplate", augments={'"Drain" and "Aspir" potency +1','Pet: Phys. dmg. taken -2%','Phalanx +2','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
    feet={ name="Odyssean Greaves", augments={'Weapon Skill Acc.+11','Pet: VIT+5','Phalanx +3','Accuracy+19 Attack+19','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Odnowa Earring +1",
    right_ear="Mimir Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Weard Mantle", augments={'VIT+4','DEX+3','Enmity+5','Phalanx +3',}},
	})
	sets.midcast.Phalanx.DT = set_combine(sets.midcast.Phalanx.SIRD, {})	
	sets.Phalanx_Received = {main="Sakpata's Sword",hands="Souv. Handsch. +1",back="Weard Mantle",legs="Sakpata's Cuisses",feet="Souveran Schuhs +1"}
		
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Vim Torque +1"}
    sets.buff.Cover = {body="Cab. Surcoat +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'NIN' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'RUN' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'RDM' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'BLU' then
        set_macro_page(10, 15)
    elseif player.sub_job == 'DNC' then
        set_macro_page(10, 15)
    else
        set_macro_page(10, 15) --War/Etc
    end
end

send_command('exec init.txt')

function sub_job_change(new,old)
send_command('wait 10;input /lockstyleset 20')
end

send_command('wait 10;input /lockstyleset 20')