# ideas

- Engineering
    Level engineering buildings
    Destroy buildings when not fed or cold
    Mutiny

- scientists
    




# Todo List
- holding station for colonists only. - Waiting are in, no idea on exclusivity

- add wast as byproduct to reprocess. - maybe for later. 

- Add a landing-site were colonists are received - landing site is in, but animation is shit. 

- Add in science cost to techs, here in the doc

- Implement the planned techs and new items.

The basic idea for the science will be to add intermidiate products for each of the advanced techs. These will have the same cost as their vanila beacon equivilent. The colonists then use this intermidiate in a workshop to produce the final tech, science-pack-3, militaty-pack ... 

```
  ideas for expanding agricultural production cycle, mixed with life support expansion. 
air-filtration > nitrogen + oxygen + carbon-sulphates: all as liquids. 
mine-stone > stone, minerals 0.02%
  leave this for now
    crush-stone > stone-pulp, minerals 
    brick > stone-pulp
    stone-pulp is used in concreete 
nitrogen, sulphates, minerals > fertiliser
oxygen, water, nitrogen > life-suport-unit 

soil, steel-plate, life-support-unit, (glass if there  is a mod present), pump > hydroponics-building

Should life support be requierd as input to each colonist recipe? Maybe have it requiered to build then assumed it's a closed system with little to no loss. I like this idea. 

electronic-circuit, iron-plate > consumer-tech
cotton > clothes - leave this one for now. 
```

# TECH PROGRESSION
```
automation-2 > air-filtration > colonists-construction > colonists-agriculture

steel-processing > colonists-construction
air-filtration > pollutant-sequestration

advanced-electronics > colonists-coms > colonists-agriculture > colonists-charter > articles-of-colonisation

colonists-charter > colonists-bio-research > planethood

articles-of-colonisation > colonists-reproductive-initiative > planethood

articles-of-colonisation > charter-amendment-1 > charter-amendment-n

military-2 > colonists-military-research

articles-of-colonisation > colonists-production-optimisation > colonists-high-tech-production > colonists-space-reaserch >  planethood

advanced-material-processing-2 > colonists-production-optimisation
advanced-electronics-2 > colonists-high-tech-production
rocket-silo > colonists-space-reaserch

...
```
# TECH DESCRIPTION
```
  atmospheric-sequestration
unlock recipe: nitrogen-sequestration, oxygen-sequestration, atmospheric-sequestor, 
ingredients: science-pack-1 x50, science-pack-2 x50
time: 10
done: icon, tech

  pollutant-sequestration
unlock recipe: pollutant-sequestration
will see where to add this, not the highest priority. 

  colonists-coms
unlock recipe: coms-dish,  colonist-arrival-data
ingredients: science-pack-1 x50, science-pack-2 x50
time: 15
done: icon, tech

colonists-construction
unlock recipe: housing, workshop, waiting-hall, consumer-goods
ingredients: science-pack-1 x50, science-pack-2 x50
time: 10, icon, tech 

  colonists-agriculture
unlock recipe: hydroponics-building, soil, fertiliser, automated-food
ingredients: science-pack-1 x80, science-pack-2 x80
time: 15
done: icon, tech, 

  colonists-bio-research
unlock recipe: bio-research, grow-lumber, field-equipment
ingredients: science-pack-1 x100, science-pack-2 x 100
time: 15
This should be the way to produce blue science packs. 
done: icon, tech

  colonists-charter
unlock recipe: landing-site, landing-colonists,
ingredients: science-pack-1 x80, science-pack-2 x80
time: 15
done: icon, tech

  articles-of-colonisation
unlock recipe: legal-work
ingredients: science-pack-1 x150, science-pack-2 x150
time: 20
done: icon, tech

  colonists-reproductive-initiative
unlock recipe: reproduce, memorial, heal, medical-supplies
ingredients: science-pack-1 x100, science-pack-2 x100, legal-documents x200
time: 20
done: icon, tech

colonists-military-research
unlock recipe: military-equipment, 
TODO: figureout where this fits in
done: icon, tech

colonists-production-optimisation
unlock recipe: industrial-equipment, production-science-pack
ingredients: science-pack-1 x200, science-pack-2 x200, science-pack-3 x200,legal-documents x200
time: 30
done: icon, tech

colonists-high-tech-production
unlock recipe: high-tech-equipment, high-tech-science-pack
ingredients: science-pack-1 x250, science-pack-2 x250, science-pack-3 x250, legal-documents x250
time: 30
done: icon, tech

  charter-amendment
this is where we put some sort of colonist output improvements, maybe workshop craft speed or something. 

  planethood
this will be the final colonists tech, the *goal* of the mod.
done: icon, tech

...
```
# RECIPE DESCRIPTION
```
atmospheric-sequestor
type: entity
subgroup: colonists-buildings
energy: 4
ingredients: pump x5, iron-plate x10, electronic-circuit x20, copper-plate x20
done: entity, recipe, item, graphics,

atmospheric-sequestration
type: fluid recipe
produces: oxygen, nitrogen, pollutant
done: fuild-recipe, icon

oxygen, nitrogen, pollutant
type: fluid
done: fluid.lua protoype

life-support-fuild - not needed if life support unit is made with chemistry
type: fluid
subgroup: colonists-atmospherics
category: chemistry

life-support-unit
type: itme, recipe
subgroup: colonists-products
category: chemistry, crafting-with-fluid
energy: 1
ingredients: oxygen x5, nitrogen x15, water x10, pump x1, 
done: item, recipe

colonial-housing
type: entity, recipe
ingredients: life-suport-unit x10, steel x15, (glass if mod), electronics-circuit x10
done: recipe, graohics, item

colonial-workshop
ingredients: life-suport-unit x10, steel x20, (glass if mod), fast-inserters x5, electronics-circuit x10
done: recipe, graohics, item


waiting-hall
ingredients: life-support-uni x8, steel x30, (glass if mod), electronics-circuit x10
done: recipe, graohics, item

consumer-goods
ingredients: electronic-circuit x4, iron-plate x2
done: icon, recipe, item 

fertiliser
ingredients: nitrogen x10, minerals x2
done: recipe, uses stone instead of minrals for now
done: icon, recipe, item

soil
ingredients: raw-wood x10, water x10, 
result: 5
DONE: icon, recipe, item

<!-- science intermidiates -->

  field-equipment
type: itme
subgroup: colonists-products
energy: 1
ingredients: engine-unit x1, advanced-circuit x1, iron-gear-wheel x5, iron-plate x10
done: icon, tech, recipe, item

  bio-research
category: colonists-agriculture
energy: 70 (vanilla blue is 12, time should be balanced with output)
ingretients: field-equipment x6, colonist x3, fertiliser x2, water x10
result: tierd-colonist x3, science-pack-3 x6
done: icon, tech, recipe

  military-equipment
ingredients: grenade x1, gun-turret x1, piercing-rounds-magazine x1
done: icon, tech, recipe, item

  military-science-pack 
category: colonists-work
energy: 70
ingredients: colonist x3, military-equipment x6
done: use vanila icon, 

  industrial-equipment
ingredients: electric-engine-unit x1, electric-furnace  x1
done: icon, tech, recipe, item

  production-science-pack
category: colonists-work
energy: 70
ingredients: colonist x3, industrial-equipment x5
done: use vanila icon,

  high-tech-equipment
ingredients: battery x1, copper-cable x30, processing-unit x3, speed-module x1
done: icon, tech, recipe, item

  high-tech-science-pack
category: colonists-work
energy: 70
ingredients: colonist x3, high-tech-equipment x5
done: icon,

<!-- end science intermidiates  -->

  optical-observatory
subgroup: colonists-buildings
used to produce space science, will look like a giant telescope. 
done:

  observation-equipment
something balanced for the lategame tech upgrades. 
done:
...
```
# THINGS to think about after this tech addition
- addin airfilters as an intermidiate for life support units and atmo-sequestor possibley as consumable for atmo-sequestor
- missing colony ship and pods recipe. 


# other stuff

Migration snippets for future use 
```
for index, force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes

  recipes["rail-chain-signal"].enabled = technologies["rail-signals"].researched

  if technologies["tanks"].researched then
    recipes["explosive-cannon-shell"].enabled = true
    recipes["cannon-shell"].reload()
    recipes["explosive-cannon-shell"].reload()
  end
end
```
