using {com.dscgmbh.poc.replace_me as db} from '../db/_replace_me';


service main_service {

  entity Belege          as projection on db.Belege;
  entity Positionen      as projection on db.Belege.items;
  entity Arbeitsschritte as projection on db.Belege.items.steps;
};

annotate main_service.Belege with @Common.SemanticKey: [ID];

annotate main_service.Positionen with @Common.SemanticKey: [
  up__ID,
  ID
];

annotate main_service.Arbeitsschritte with @Common.SemanticKey: [
  up__up__ID,
  up__ID,
  ID
];