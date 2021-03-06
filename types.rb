#### get rid of static errors


class ActiveRecord::Base
  extend RDL::Annotate
  type :initialize, '(``DBType.rec_to_schema_type(trec, true)``) -> self', wrap: false
  type 'self.create', '(``DBType.rec_to_schema_type(trec, true)``) -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :initialize, '() -> self', wrap: false
  type 'self.create', '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  
end

module ActiveRecord::Core::ClassMethods
  extend RDL::Annotate
  ## Types from this module are used when receiver is ActiveRecord::Base

  type :find, '(Integer) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find, '(Array<Integer>) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find, '(Integer, Integer, *Integer) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find_by, '(``DBType.rec_to_schema_type(trec, true)``) -> ``DBType.rec_to_nominal(trec)``', wrap: false
  ## TODO: find_by's with conditions given as string

end

module ActiveRecord::FinderMethods
  extend RDL::Annotate
  ## Types from this module are used when receiver is ActiveRecord_Relation
  
  type :find, '(Integer) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find, '(Array<Integer>) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find, '(Integer, Integer, *Integer) -> ``DBType.find_output_type(trec, targs)``', wrap: false
  type :find_by, '(``DBType.rec_to_schema_type(trec, true)``) -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :first, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :first!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :first, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :last, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :last!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :last, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :take, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :take!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :take, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :exists?, '() -> %bool', wrap: false
  type :exists?, '(Integer or String) -> %bool', wrap: false
  type :exists?, '(``DBType.exists_input_type(trec, targs)``) -> %bool', wrap: false

  ## TODO: find_by's with conditions given as string

end

module ActiveRecord::Querying
  extend RDL::Annotate
  ## Types from this module are used when receiver is ActiveRecord::Base

  
  type :first, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :first!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :first, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :last, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :last!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :last, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :take, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :take!, '() -> ``DBType.rec_to_nominal(trec)``', wrap: false
  type :take, '(Integer) -> ``DBType.rec_to_array(trec)``', wrap: false
  type :exists?, '() -> %bool', wrap: false
  type :exists?, '(Integer or String) -> %bool', wrap: false
  type :exists?, '(``DBType.exists_input_type(trec, targs)``) -> %bool', wrap: false
  type :group, '(Symbol) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``'


  type :where, '(``DBType.where_input_type(trec, targs)``) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false
  type :where, '(String, Hash) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false
  type :where, '(String, *String) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false
  type :where, '() -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord::QueryMethods::WhereChain), DBType.rec_to_nominal(trec))``', wrap: false


  type :joins, '(``DBType.joins_one_input_type(trec, targs)``) -> ``DBType.joins_output(trec, targs)``', wrap: false
  type :joins, '(``DBType.joins_multi_input_type(trec, targs)``, Symbol or Hash, *Symbol or Hash) -> ``DBType.joins_output(trec, targs)``', wrap: false


end

module ActiveRecord::QueryMethods
  extend RDL::Annotate
  ## Types from this module are used when receiver is ActiveRecord_relation

  type :group, '(Symbol) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), trec.params[0])``', wrap: false
  type :where, '(``DBType.where_input_type(trec, targs)``) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), trec.params[0])``', wrap: false
  type :where, '(String, Hash) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), trec.params[0])``', wrap: false
  type :where, '(String, *String) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), trec.params[0])``', wrap: false
  type :where, '() -> ``DBType.where_noarg_output_type(trec)``', wrap: false

  type :joins, '(``DBType.joins_one_input_type(trec, targs)``) -> ``DBType.joins_output(trec, targs)``', wrap: false
  type :joins, '(``DBType.joins_multi_input_type(trec, targs)``, Symbol, *Symbol) -> ``DBType.joins_output(trec, targs)``', wrap: false


end


class ActiveRecord::QueryMethods::WhereChain
  extend RDL::Annotate
  type_params [:t], :dummy

  type :not, '(``DBType.not_input_type(trec, targs)``) -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), trec.params[0])``', wrap: false

end

class JoinTable
  extend RDL::Annotate
  type_params [:orig, :joined], :dummy
  ## type param :orig will be nominal type of base table in join
  ## type param :joined will be a union type of all joined tables, or just a nominal type if there's only one

  ## this class is meant to only be the type parameter of ActiveRecord_Relation or WhereChain, expressing multiple joined tables instead of just a single table
end



module ActiveRecord::Scoping::Named::ClassMethods
  extend RDL::Annotate
  type :all, '() -> ``RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), DBType.rec_to_nominal(trec))``', wrap: false

end

class ActiveRecord_Relation
  ## In practice, this is actually a private class nested within
  ## each ActiveRecord::Base, e.g. Person::ActiveRecord_Relation.
  ## Using this class just for type checking.
  extend RDL::Annotate
  include ActiveRecord::QueryMethods
  include ActiveRecord::FinderMethods

  type_params [:t], :dummy

  type :each, '() -> Enumerator<t>', wrap: false
  type :each, '() { (t) -> %any } -> Array<t>', wrap: false
end


class DBType
  ## given a type (usually representing a receiver type in a method call), this method returns the nominal type version of that type.
  ## if the given type represents a joined table, then we return the nominal type version of the *base* of the joined table.
  ## [+ t +] is the type for which we want the nominal type.
  def self.rec_to_nominal(t)
    case t
    when RDL::Type::SingletonType
      val = t.val
      raise RDL::Typecheck::StaticTypeError, "Expected class singleton type, got #{val} instead." unless val.is_a?(Class)
      return RDL::Type::NominalType.new(val)
    when RDL::Type::GenericType
      raise RDL::Typecheck::StaticTypeError, "got unexpected type #{t}" unless t.base.klass == ActiveRecord_Relation
      param = t.params[0]
      case param
      when RDL::Type::GenericType
        ## should be JoinTable
        ## When getting an indivual record from a join table, record will be of type of the base table in the join
        raise RDL::Typecheck::StaticTypeError, "got unexpected type #{param}" unless param.base.klass == JoinTable
        return param.params[0]
      when RDL::Type::NominalType
        return param
      else
        raise RDL::Typecheck::StaticTypeError, "got unexpected type #{t.params[0]}"
      end
    end
  end

  def self.rec_to_array(trec)
    RDL::Type::GenericType.new(RDL::Globals.types[:array], rec_to_nominal(trec))
  end

  ## given a receiver type in various kinds of query calls, returns the accepted finite hash type input,
  ## or a union of types if the receiver represents joined tables.
  ## [+ trec +] is the type of the receiver in the method call.
  ## [+ check_col +] is a boolean indicating whether or not the column types (i.e., values in the finite hash type) will be checked.
  def self.rec_to_schema_type(trec, check_col)
    case trec
    when RDL::Type::GenericType
      raise "Unexpected type #{trec}." unless (trec.base.klass == ActiveRecord_Relation) || (trec.base.klass == ActiveRecord::QueryMethods::WhereChain)
      param = trec.params[0]
      case param
      when RDL::Type::GenericType
        ## should be JoinTable
        raise "unexpected type #{trec}" unless param.base.klass == JoinTable
        base_name = param.params[0].klass.to_s.singularize.to_sym ### singularized symbol name of first param in JoinTable, which is base table of the joins
        type_hash = table_name_to_schema_type(base_name, check_col).elts
        case param.params[1]
        when RDL::Type::NominalType
          ## just one table joined to base table
          joined_name = param.params[1].klass.to_s.singularize.to_sym
          joined_type = RDL::Type::OptionalType.new(table_name_to_schema_type(joined_name, check_col))
          type_hash[joined_name.to_s.pluralize.downcase.to_sym] = joined_type ## type queries on joined tables use the joined table's plural name
        when RDL::Type::UnionType
          ## multiple tables joined to base table
          joined_hash = {} ## this will be hash mapping plural table names to their type schema. will be necessary for nested hash calls                  
          param.params[1].types.each { |t|
            joined_name = t.klass.to_s.singularize.to_sym
            joined_type = table_name_to_schema_type(joined_name, check_col)
            joined_hash[joined_name.to_s.pluralize.downcase.to_sym] = joined_type #RDL::Type::OptionalType.new(joined_type) ## type queries on joined tables use the joined table's plural name
          }
          joined_hash.each { |k1, v1|
            joined_hash.each { |k2, v2|
              v1.elts[k2] = RDL::Type::OptionalType.new(v2)
              type_hash[k1] = RDL::Type::OptionalType.new(v1)
            }
          }
        else
          raise "unexpected type #{trec}"
        end
        return RDL::Type::FiniteHashType.new(type_hash, nil)
      when RDL::Type::NominalType
        tname = param.klass.to_s.to_sym
        return table_name_to_schema_type(tname, check_col)
      else
        raise RDL::Typecheck::StaticTypeError, "Unexpected type parameter in  #{trec}."
      end
    when RDL::Type::SingletonType
      raise RDL::Typecheck::StaticTypeError, "Unexpected receiver type #{trec}." unless trec.val.is_a?(Class)
      tname = trec.val.to_s.to_sym
      return table_name_to_schema_type(tname, check_col)
    when RDL::Type::NominalType
      raise "GOT HERE BUT WASN'T EXPECTING IT."
    else
      raise RDL::Typecheck::StaticTypeError, "Unexpected receiver type #{trec}."
    end
            
  end

  ## turns a given table name into the appropriate finite hash type based on table schema, with optional or top-type values
  ## [+ tname +] is the table name as a symbol
  ## [+ check_col +] is a boolean indicating whether or not column types will eventually be checked
  def self.table_name_to_schema_type(tname, check_col)
    h = {}
    ttype = RDL::Globals.db_schema[tname]
    raise RDL::Typecheck::StaticTypeError, "No table type for #{tname} found." unless ttype      
    tschema = ttype.params[0].elts.except(:__associations)
    tschema.each { |k, v|
      if check_col
        h[k] = RDL::Type::OptionalType.new(v)
      else
        h[k] = RDL::Type::OptionalType.new(RDL::Globals.types[:top])
      end
    }
    RDL::Type::FiniteHashType.new(h, nil)
  end

  def self.where_input_type(trec, targs)
    tschema = rec_to_schema_type(trec, true)
    return RDL::Type::UnionType.new(tschema, RDL::Globals.types[:string], RDL::Globals.types[:array]) ## no indepth checking for string or array cases
  end

  def self.where_noarg_output_type(trec)
    case trec
    when RDL::Type::SingletonType
      ## where called directly on class
      RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord::QueryMethods::WhereChain), rec_to_nominal(trec))
    when RDL::Type::GenericType
    ## where called on ActiveRecord_Relation
      raise RDL::Typecheck::StaticTypeError, "Unexpected receiver type #{trec}." unless trec.base.klass == ActiveRecord_Relation
      return RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord::QueryMethods::WhereChain), trec.params[0])
    else
      raise RDL::Typecheck::StaticTypeError, "Unexpected receiver type #{trec}."
    end
  end
  
  def self.not_input_type(trec, targs)
    tschema = rec_to_schema_type(trec, true)
    return RDL::Type::UnionType.new(tschema, RDL::Globals.types[:string], RDL::Globals.types[:array]) ## no indepth checking for string or array cases
  end

  def self.exists_input_type(trec, targs)
    raise "Unexpected number of arguments to ActiveRecord::Base#exists?." unless targs.size <= 1
    return RDL::Globals.types[:top] if targs[0].nil? ## no args provided, this type won't be looked at
    case targs[0]
    when RDL::Type::FiniteHashType
      return rec_to_schema_type(trec, false)
    else
      ## any type can be accepted, only thing we're intersted in is when a hash is given
      ## TODO: what if we get a nominal Hash type?
      return targs[0]
    end
  end


  def self.find_output_type(trec, targs)
    ### TODO: find can actually take any type and attempts to use to_i, but will just return RecordNotFound for incompatible types. e.g., Person.find('hi') returns RecordNotFound. Account for this?
    ### TODO: Account for non-integer primary keys? Seems rare.
    case targs.size
    when 0
      raise RDL::Typecheck::StaticTypeError, "No arguments given to ActiveRecord::Base#find."
    when 1
      case targs[0]
      when RDL::Globals.types[:integer]
        DBType.rec_to_nominal(trec)
      when RDL::Type::SingletonType
      # expecting symbol or integer here
        case targs[0].val
        when Integer
          DBType.rec_to_nominal(trec)
        when Symbol
        ## TODO
        ## Actually, this is deprecated in later versions
          raise RDL::Typecheck::StaticTypeError, "Unexpected arg type #{targs[0]} in call to ActiveRecord::Base#find."
        else
          raise RDL::Typecheck::StaticTypeError, "Unexpected arg type #{targs[0]} in call to ActiveRecord::Base#find."
        end
      when RDL::Type::GenericType
        #raise RDL::Type::StaticTypeError, "Unexpected arg type #{targs[0]} in call to ActiveRecord::Base#find." unless (targs[0].base == RDL::Globals.types[:array]) && (targs[0].params[0] == RDL::Globals.types[:integer])
        RDL::Type::GenericType.new(RDL::Globals.types[:array], DBType.rec_to_nominal(trec))
      when RDL::Type::TupleType
        RDL::Type::GenericType.new(RDL::Globals.types[:array], DBType.rec_to_nominal(trec))
      else
        raise RDL::Typecheck::StaticTypeError, "Unexpected arg type #{targs[0]} in call to ActiveRecord::Base#find."
      end
    else
      DBType.rec_to_nominal(trec)
    end
  end

  def self.joins_one_input_type(trec, targs)
    return RDL::Globals.types[:top] unless targs.size == 1 ## trivial case, won't be matched
    case trec
    when RDL::Type::SingletonType
      base_klass = trec.val 
    when RDL::Type::GenericType
      raise "Unexpected type #{trec}." unless (trec.base.klass == ActiveRecord_Relation)
      param = trec.params[0]
      case param
      when RDL::Type::GenericType
        raise "Unexpected type #{trec}." unless (param.base.klass == JoinTable)
        base_klass = param.params[0].klass
      when RDL::Type::NominalType
        base_klass = param.klass
      else
        raise "unexpected parameter type in #{trec}"
      end
    else
      raise "unexpected receiver type #{trec}"
    end
    case targs[0]
    when RDL::Type::SingletonType
      sym = targs[0].val
      raise RDL::Typecheck::StaticTypeError, "Unexpected arg type #{trec} in call to joins." unless sym.is_a?(Symbol)
      raise RDL::Typecheck::StaticTypeError, "#{trec} has no association to #{targs[0]}, cannot perform joins." unless associated_with?(base_klass, sym)
      return targs[0]
    when RDL::Type::FiniteHashType
      targs[0].elts.each { |key, val|
        raise RDL::Typecheck::StaticTypeError, "Unexpected hash arg type #{targs[0]} in call to joins." unless key.is_a?(Symbol) && val.is_a?(RDL::Type::SingletonType) && val.val.is_a?(Symbol)
        val_sym = val.val
        raise RDL::Typecheck::StaticTypeError, "#{trec} has no association to #{key}, cannot perform joins." unless associated_with?(base_klass, key)
        key_klass = key.to_s.singularize.camelize
        raise RDL::Typecheck::StaticTypeError, "#{key} has no association to #{val_sym}, cannot perform joins." unless associated_with?(key_klass, val_sym)
      }
      return targs[0]
    else
      raise RDL::Typecheck::StaticTypeError, "Unexpected arg type #{targs[0]} in call to joins."
    end
  end

  def self.joins_multi_input_type(trec, targs)
    return RDL::Globals.types[:top] unless targs.size > 1 ## trivial case, won't be matched
    targs.each { |arg|
      joins_one_input_type(trec, [arg])
    }
    return targs[0] ## since this method is called as first argument in type
  end

  def self.associated_with?(rec, sym)
    tschema = RDL::Globals.db_schema[rec.to_s.to_sym]
    raise RDL::Typecheck::StaticTypeError, "No table type for #{rec} found." unless tschema
    schema = tschema.params[0].elts
    assoc = schema[:__associations]
    raise RDL::Typecheck::StaticTypeError, "Table #{rec} has no associations, cannot perform joins." unless assoc
    assoc.elts.each { |key, value|
      case value
      when RDL::Type::SingletonType
        return true if value.val == sym ## no need to change any plurality here
      when RDL::Type::UnionType
        ## for when rec has multiple of the same kind of association
        value.types.each { |t|
          raise "Unexpected type #{t}." unless t.is_a?(RDL::Type::SingletonType) && (t.val.class == Symbol)
          return true if t.val == sym
        }
      else
        raise RDL::Typecheck::StaticTypeError, "Unexpected association type #{value}"
      end        
    }
    return false
  end

  def self.get_joined_args(targs)
    arg_types = []
    targs.each { |arg|
    case arg
    when RDL::Type::SingletonType
      raise RDL::Typecheck::StaticTypeError, "Unexpected joins arg type #{arg}" unless (arg.val.class == Symbol)
      arg_types << RDL::Type::NominalType.new(arg.val.to_s.singularize.camelize)
    when RDL::Type::FiniteHashType
      hsh = arg.elts
      raise 'not supported' unless hsh.size == 1
      key, val = hsh.first
      val = val.val
      arg_types << RDL::Type::UnionType.new(RDL::Type::NominalType.new(key.to_s.singularize.camelize), RDL::Type::NominalType.new(val.to_s.singularize.camelize))
    else
      raise "Unexpected arg type #{arg} to joins."
    end
    }
    if arg_types.size > 1
      return RDL::Type::UnionType.new(*arg_types)
    elsif arg_types.size == 1
      return arg_types[0]
    else
      raise "oops, didn't expect to get here."
    end
  end
  
  def self.joins_output(trec, targs)
    arg_type = get_joined_args(targs)
    case trec
    when RDL::Type::SingletonType
      joined = arg_type
    when RDL::Type::GenericType
      raise "Unexpected type #{trec}." unless (trec.base.klass == ActiveRecord_Relation)
      param = trec.params[0]
      case param
      when RDL::Type::GenericType
        raise "Unexpected type #{trec}." unless (param.base.klass == JoinTable)
        joined = RDL::Type::UnionType.new(param.params[1], arg_type)
      when RDL::Type::NominalType
        joined = arg_type
      else
        raise "unexpected parameter type in #{trec}"
      end
    else
      raise "unexpected type #{trec}"
    end
    jt = RDL::Type::GenericType.new(RDL::Type::NominalType.new(JoinTable), rec_to_nominal(trec), joined)
    RDL::Type::GenericType.new(RDL::Type::NominalType.new(ActiveRecord_Relation), jt)
  end

end
