minetest.register_node("viron:viron_spawner", {
    description = "viron_spawner",
    tiles = {"viron_viron_spawner.png"},
    drawtype = "glasslike",
    paramtype = "light",
    light_source = 5,
    sunlight_propagates = true,
    is_ground_content = false,
    sounds = default.node_sound_glass_defaults(),
    groups = {cracky=3, stone=1}
})

mobs:register_mob("viron:viron_mob", {
	type = "monster",
	hp_min = 45,
	hp_max = 50,
	armor = 75,
	passive = false,
	walk_velocity = 4,
	stand_chance = 60,
	walk_chance = 10,
	run_velocity = 6,
	stepheight = 1.6,
  stay_near = {
    nodes = {
      "default:stone_with_diamond",
      "default:mese",
    },

  },
	pushable = true,
	view_range = 15,
	damage = 15,
	knock_back = true,
	fear_height = 5,
	water_damage = 20,
	lava_damage = 0,
	light_damage = 0,
	suffocation = false,
	floats = false,
	follow = {
		"default:diamond",
		"default:mese_crystal",
	},
  reach = 2,
	attack_chance = 70,
	attack_monsters = false,
	attack_animals = true,
  attack_npcs = true,
  attack_players = true,
  owner_loyal = true,
  group_attack = true,
	attack_type = "dogfight",
	blood_texture = "viron_blood.png",
	pathfinding = 1,
  immune_to = {

    {"defualt:diamond", -50},
  },
	makes_footstep_sound = false,
  sounds = {
    distance = 25,
    random = "viron_viron_talk",
    war_cry = "viron_viron_angry",
    attack = "viron_viron_hit",
    damage = "viron_viron_angry",
    death = "viron_viron_die",
    jump = "viron_viron_talk",

  },
drops = function(pos)
    local mob_drops
    mob_drops = {
  		{name = "defualt:diamond_block", chance = 3, min = 1, max = 5},
      {name = "defualt:diamond", chance = 5, min = 0, max = 5},
      {name = "defualt:mese", chance = 6, min = 0, max = 4},
      {name = "defualt:mese_crystal", chance = 2, min = 0, max = 10},
      {name = "bucket:bucket_lava", chance = 9, min = 1, max = 2},
      {name = "defualt:steel_block", chance = 7, min = 0, max = 10},
      {name = "viron:viron_spawner", chance = 500, min = 1, max = 1},
    }
    if minetest.get_modpath("obsidianmese") then
      table.insert(mob_drops, {name = "obsidianmese:sword_engraved:sword_engraved", chance = 20, min = 0, max = 1})
      table.insert(mob_drops, {name = "obsidianmese:mese_apple", chance = 5, min = 0, max = 3})
    end
    if minetest.get_modpath("gadgets_magic") then
      table.insert(mob_drops, {name = "gadgets_magic:staff_earth:staff_earth", chance = 20, min = 0, max = 1})
    end
    return mob_drops
  end,



	visual = "mesh",
	collisionbox = {-0.3, -0.5, -0.3, 0.3, 1.5, 0.3},
	mesh = "viron_viron_mob.b3d",
	textures = {
		{"viron_viron_texture.png"},

	},
  glow = 10,
	animation = {
		stand_start = 40,
		stand_end = 85,
    stand_speed = 10,
    stand1_start = 87,
    stand1_end = 100,
    stand1_speed = 10,
    stand2_start = 103,
    stand2_end = 145,
    stand2_speed = 10,
    stand3_start = 140,
    stand3_end = 170,
    stand3_speed = 5,
    stand3_loop = false,
		walk_start = 0,
		walk_end = 30,
		walk_speed = 30,
		run_start = 0,
		run_end = 30,
		run_speed = 50,
    punch_start = 170,
    punch_end = 200,
    punch_speed = 27,
	},




})




mobs:spawn({
	name = "viron:viron_mob",
	neighbors = {"default:stone_with_diamond","defualt:stone_with_mese"},

	chance = 2,
  interval = 30,
	active_object_count = 2,

})


mobs:spawn({
	name = "viron:viron_mob",
	neighbors = {"viron:viron_spawner"},

	chance = 1,
  interval = 30,
	active_object_count = 8,

})



mobs:register_egg("viron:viron_mob", "Viron", "viron_viron_egg.png", 1)
