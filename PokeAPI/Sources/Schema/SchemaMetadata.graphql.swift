// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == PokeAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == PokeAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == PokeAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == PokeAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "query_root": return PokeAPI.Objects.Query_root
    case "pokemon_v2_pokemon": return PokeAPI.Objects.Pokemon_v2_pokemon
    case "pokemon_v2_pokemonspecies": return PokeAPI.Objects.Pokemon_v2_pokemonspecies
    case "pokemon_v2_pokemonspeciesflavortext": return PokeAPI.Objects.Pokemon_v2_pokemonspeciesflavortext
    case "pokemon_v2_pokemonspeciesname": return PokeAPI.Objects.Pokemon_v2_pokemonspeciesname
    case "pokemon_v2_pokemontype": return PokeAPI.Objects.Pokemon_v2_pokemontype
    case "pokemon_v2_type": return PokeAPI.Objects.Pokemon_v2_type
    case "pokemon_v2_pokemonability": return PokeAPI.Objects.Pokemon_v2_pokemonability
    case "pokemon_v2_ability": return PokeAPI.Objects.Pokemon_v2_ability
    case "pokemon_v2_abilityeffecttext": return PokeAPI.Objects.Pokemon_v2_abilityeffecttext
    case "pokemon_v2_abilityflavortext": return PokeAPI.Objects.Pokemon_v2_abilityflavortext
    case "pokemon_v2_pokemonstat": return PokeAPI.Objects.Pokemon_v2_pokemonstat
    case "pokemon_v2_stat": return PokeAPI.Objects.Pokemon_v2_stat
    case "pokemon_v2_pokemonsprites": return PokeAPI.Objects.Pokemon_v2_pokemonsprites
    case "pokemon_v2_typeefficacy": return PokeAPI.Objects.Pokemon_v2_typeefficacy
    case "pokemon_v2_pokedex": return PokeAPI.Objects.Pokemon_v2_pokedex
    case "pokemon_v2_pokemondexnumber": return PokeAPI.Objects.Pokemon_v2_pokemondexnumber
    case "pokemon_v2_encounter": return PokeAPI.Objects.Pokemon_v2_encounter
    case "pokemon_v2_locationarea": return PokeAPI.Objects.Pokemon_v2_locationarea
    case "pokemon_v2_location": return PokeAPI.Objects.Pokemon_v2_location
    case "pokemon_v2_locationname": return PokeAPI.Objects.Pokemon_v2_locationname
    case "pokemon_v2_encounterslot": return PokeAPI.Objects.Pokemon_v2_encounterslot
    case "pokemon_v2_encountermethod": return PokeAPI.Objects.Pokemon_v2_encountermethod
    case "pokemon_v2_pokemonmove": return PokeAPI.Objects.Pokemon_v2_pokemonmove
    case "pokemon_v2_move": return PokeAPI.Objects.Pokemon_v2_move
    case "pokemon_v2_movedamageclass": return PokeAPI.Objects.Pokemon_v2_movedamageclass
    case "pokemon_v2_machine": return PokeAPI.Objects.Pokemon_v2_machine
    case "pokemon_v2_item": return PokeAPI.Objects.Pokemon_v2_item
    case "pokemon_v2_movelearnmethod": return PokeAPI.Objects.Pokemon_v2_movelearnmethod
    case "pokemon_v2_versiongroup": return PokeAPI.Objects.Pokemon_v2_versiongroup
    case "pokemon_v2_version": return PokeAPI.Objects.Pokemon_v2_version
    case "pokemon_v2_pokedexversiongroup": return PokeAPI.Objects.Pokemon_v2_pokedexversiongroup
    case "pokemon_v2_evolutionchain": return PokeAPI.Objects.Pokemon_v2_evolutionchain
    case "pokemon_v2_pokemonevolution": return PokeAPI.Objects.Pokemon_v2_pokemonevolution
    case "pokemon_v2_evolutiontrigger": return PokeAPI.Objects.Pokemon_v2_evolutiontrigger
    case "pokemon_v2_gender": return PokeAPI.Objects.Pokemon_v2_gender
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
