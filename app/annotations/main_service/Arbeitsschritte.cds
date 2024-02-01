using main_service as service from '../../../srv/main_service';

/*
SelectionFields
*/
annotate service.Arbeitsschritte with @UI.SelectionFields: [
    ID,
    stepName,
    stepStatus.code,
];

/*
LineItem
*/
annotate service.Arbeitsschritte with @UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: ID,
    },
    {
        $Type: 'UI.DataField',
        Value: stepName,
    },
    {
        $Type: 'UI.DataField',
        Value: stepStatus.code,
    },
];

/*
UI
*/
annotate service.Arbeitsschritte with @(

    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: stepName,
            },
            {
                $Type: 'UI.DataField',
                Value: stepStatus.code,
            },

        ],

    },

    UI.Facets    : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>AllgemeineInformation}',
        Target: '@UI.FieldGroup',
    }]
);
