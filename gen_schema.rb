



def add_assoc(hash, aname, aklass)
  kl_type = RDL::Type::SingletonType.new(aklass)
  if hash[aname]
    hash[aname] = RDL::Type::UnionType.new(hash[aname], kl_type)
  else
    hash[aname] = kl_type unless hash[aname]
  end
  hash
end

#Rails.application.eager_load!
MODELS = ActiveRecord::Base.descendants.each { |m| m.send(:load_schema) unless m.abstract_class? }

MODELS.each { |model|
  #next if model == ApplicationRecord
  s1 = model.columns_hash.transform_values { |v| RDL::Type::NominalType.new(v.type.to_s.camelize) }
  s2 = s1.transform_keys { |k| k.to_sym }
  assoc = {}
  model.reflect_on_all_associations.each { |a|
    add_assoc(assoc, a.macro, a.name)
  }
  s2[:__associations] = RDL::Type::FiniteHashType.new(assoc, nil)
  base_name = model.to_s
  base_type = RDL::Type::NominalType.new(model.to_s)
  hash_type = RDL::Type::FiniteHashType.new(s2, nil)
  schema = RDL::Type::GenericType.new(base_type, hash_type)
  RDL::Globals.db_schema[base_name.to_sym] = schema
}
