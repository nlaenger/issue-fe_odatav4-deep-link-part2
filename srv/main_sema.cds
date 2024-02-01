using {com.dscgmbh.poc.replace_me as db} from '../db/_replace_me';


service main_sema {

  entity Belege          as projection on db.Belege;
  entity Positionen      as projection on db.Belege.items;
  entity Arbeitsschritte as projection on db.Belege.items.steps;
};

annotate main_sema.Belege with @Common.SemanticKey: [Beleg];

annotate main_sema.Positionen with @Common.SemanticKey: [
  up__Beleg,
  Position
];

annotate main_sema.Arbeitsschritte with @Common.SemanticKey: [
  up__up__Beleg,
  up__Position,
  Schritt
];

// annotate main_sema.Belege with @Common.SemanticKey: [ID];

// annotate main_sema.Positionen with @Common.SemanticKey: [
//   up__ID,
//   ID
// ];

// annotate main_sema.Arbeitsschritte with @Common.SemanticKey: [
//   up__up__ID,
//   up__ID,
//   ID
// ];