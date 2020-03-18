local viron_spawn_height_max = 31000
setting = tonumber(minetest.settings:get("viron_spawn_height_max"))
if setting then
	viron_spawn_height_max = setting
end

local viron_spawn_height_min = -31000
setting = tonumber(minetest.settings:get("viron_spawn_height_min"))
if setting then
	viron_spawn_height_min = setting
end

local spawners = 1
setting = tonumber(minetest.settings:get("spawners"))
if setting then
	spawners = setting
end
local mob_drops
mob_drops = {
  {name = "default:mese_shard", chance = 3, min = 1, max = 2},
  {name = "default:steel", chance = 4, min = 1, max = 2},
  {name = "default:iron_lump", chance = 2, min = 1, max = 2},
  {name = "default:meselamp", chance = 3, min = 1, max = 2},
  {name = "default:mese_crystal", chance = 6, min = 1, max = 1},
  {name = "default:diamond", chance = 5, min = 1, max = 1},
  {name = "default:diamond_block", chance = 20, min = 1, max = 1},
}
if minetest.get_modpath("obsidianmese") then
  table.insert(mob_drops, {name = "obsidianmese:mese_apple", chance = 5, min = 0, max = 3})
end
if minetest.get_modpath("gadgets_magic") then
  table.insert(mob_drops, {name = "gadgets_magic:staff_earth", chance = 20, min = 0, max = 1})
end
if minetest.get_modpath("vessels") then
  table.insert(mob_drops, {name = "vessels:steel_bottle", chance = 6, min = 1, max = 1})
end
if spawners == 1 then
  table.insert(mob_drops, {name = "viron:viron_spawner", chance = 75, min = 1, max = 1})
end


if spawners == 1 then
minetest.register_node("viron:viron_spawner", {
    description = "viron_spawner",
    tiles = {"viron_viron_spawner.png"},
    drawtype = "glasslike",
    paramtype = "light",
    light_source = 5,
    sunlight_propagates = true,
    is_ground_content = false,
    sounds = default.node_sound_glass_defaults(),
    groups = {cracky=3, stone=1},
    drop = {
        max_items = 1,  -- Maximum number of items to drop.
        items = { -- Choose max_items randomly from this list.
            {
                items = {"viron:viron_spawner"},  -- Items to drop.
                rarity = 10,  -- Probability of dropping is 1 / rarity.
            },
        },
    },
})
end

mobs:register_mob("viron:viron_mob", {
	type = "monster",
	hp_min = 35,
	hp_max = 50,
	armor = 75,
	passive = false,
	walk_velocity = 4,
	stand_chance = 60,
	walk_chance = 10,
  jump = true,
  jump_height = 3,
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

    {"default:diamond", -50},
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

  drops = mob_drops,


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
	neighbors = {"default:stone_with_diamond","default:stone_with_mese"},

	chance = 3,
  interval = 30,
	active_object_count = 2,
  min_height = viron_spawn_height_min,
  max_height = viron_spawn_height_max,

})

if spawners == 1 then
mobs:spawn({
	name = "viron:viron_mob",
	neighbors = {"viron:viron_spawner"},

	chance = 1,
  interval = 30,
	active_object_count = 5,

})
end


mobs:register_egg("viron:viron_mob", "Viron", "viron_viron_egg.png", 1)

