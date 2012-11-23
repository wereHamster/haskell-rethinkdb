-- | Some seperate types to solve problems with recursive modules
module Database.RethinkDB.Types where

-- | The type of a RQL expression
-- 
-- The type hierarchy has 3 branches:
-- 
-- - A read-only sequence: @StreamType False@
-- 
-- - A selection (also called a view): @StreamType True@
-- 
-- - A value (a JSON object, array or primitive type): @ExprType@

data ExprTypeKind =
    StreamType Bool ValueTypeKind -- ^ When the flag is true, it can be updated or deleted
  | ValueType ValueTypeKind

-- | The types of values
data ValueTypeKind = NumberType | BoolType | ObjectType | ArrayType |
                     StringType | NoneType | OtherValueType