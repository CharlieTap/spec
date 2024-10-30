(* Currently, the prose directly borrows some structures of AL.
   Perhaps this should be improved later *)

type cmpop = [Xl.Bool.cmpop | Xl.Num.cmpop]

type expr = Al.Ast.expr

(* TODO: perhaps rename to `stmt`, to avoid confusion with Wasm *)
type instr =
| LetI of expr * expr
| CmpI of expr * cmpop * expr
| MemI of expr * expr
| IsValidI of expr option * expr * expr list
| MatchesI of expr * expr
| IsConstI of expr option * expr
| IfI of expr * instr list
| ForallI of (expr * expr) list * instr list
| EquivI of expr * expr
| EitherI of instr list list
| YetI of string

(* TODO: perhaps rename to avoid name clash *)
type def =
| Iff of Al.Ast.anchor * Al.Ast.expr * instr * instr list
| Algo of Al.Ast.algorithm

type prose = def list
