INSERT INTO Types (Type, Kind) VALUES ('BUILDING_TOWER_BRIDGE', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Description, PrereqTech, Cost, AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, MustNotBeLake, MustBeAdjacentLand, Entertainment, Quote, QuoteAudio)
VALUES ('BUILDING_TOWER_BRIDGE', 'LOC_BUILDING_TOWER_BRIDGE_NAME', 'LOC_BUILDING_TOWER_BRIDGE_DESCRIPTION', 'TECH_COMBUSTION', '1620', 'ADVISOR_GENERIC', '1', '1', '1', '1', '1', '3', 'LOC_BUILDING_TOWER_BRIDGE_QUOTE', 'Play_LOC_BUILDING_TOWER_BRIDGE_QUOTE');

INSERT INTO Buildings_XP2 (BuildingType, Bridge) VALUES ('BUILDING_TOWER_BRIDGE', '1');

INSERT INTO Building_ValidTerrains (BuildingType, TerrainType) VALUES ('BUILDING_TOWER_BRIDGE', 'TERRAIN_COAST');

-- +10% Production in cities on Capital Continent and +10% Gold in cities not on Capital Continent
INSERT INTO Requirements (RequirementId, RequirementType) VALUES ('REQUIRES_CITY_IS_OWNER_CAPITAL_CONTINENT', 'REQUIREMENT_CITY_IS_OWNER_CAPITAL_CONTINENT');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES	('CITY_IS_OWNER_CAPITAL_CONTINENT_REQUIREMENTS',	'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('CITY_IS_OWNER_CAPITAL_CONTINENT_REQUIREMENTS',	'REQUIRES_CITY_IS_OWNER_CAPITAL_CONTINENT');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES	('CITY_IS_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS',	'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES	('CITY_IS_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS',	'REQUIRES_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT');

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('TOWER_BRIDGE_CITIES_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES ('TOWER_BRIDGE_CITIES_GOLD', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('TOWER_BRIDGE_CITY_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 'CITY_IS_OWNER_CAPITAL_CONTINENT_REQUIREMENTS');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('TOWER_BRIDGE_CITY_GOLD', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 'CITY_IS_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITIES_PRODUCTION', 'ModifierId', 'TOWER_BRIDGE_CITY_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITIES_GOLD', 'ModifierId', 'TOWER_BRIDGE_CITY_GOLD');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITY_PRODUCTION', 'Amount', 10);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITY_GOLD', 'YieldType', 'YIELD_GOLD');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES ('TOWER_BRIDGE_CITY_GOLD', 'Amount', 10);

INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_TOWER_BRIDGE', 'TOWER_BRIDGE_CITIES_PRODUCTION');
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES ('BUILDING_TOWER_BRIDGE', 'TOWER_BRIDGE_CITIES_GOLD');