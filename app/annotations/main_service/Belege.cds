using main_service as service from '../../../srv/main_service';

/*
SelectionFields
*/
annotate service.Belege with @UI.SelectionFields: [
    ID,
    amount,
    land.code,
    status.code,
];

/*
LineItem
*/
annotate service.Belege with @UI.LineItem: [

    {
        $Type         : 'UI.DataFieldWithIntentBasedNavigation',
        Value         : ID,
        SemanticObject: 'belege',
        Action        : 'view',
        // Test part 3 when basics are fixed
        // Mapping       : [
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : Beleg,
        //         SemanticObjectProperty: 'Belege',
        //     },
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : HasActiveEntity,
        //         SemanticObjectProperty: 'HasActiveEntity',
        //     },
        // ],
    },
    {
        $Type         : 'UI.DataFieldWithIntentBasedNavigation',
        Value         : amount,
        SemanticObject: 'belege',
        Action        : 'view',
        // Test part 3 when basics are fixed
        // Mapping       : [
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : Beleg,
        //         SemanticObjectProperty: 'Belege',
        //     },
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : HasActiveEntity,
        //         SemanticObjectProperty: 'HasActiveEntity',
        //     },
        // ],
    },
    {
        $Type: 'UI.DataField',
        Value: land.code
    },
    {
        $Type: 'UI.DataField',
        Value: status.code
    },
];

/*
UI
*/
annotate service.Belege with @(
    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: amount,
            },
            {
                $Type: 'UI.DataField',
                Value: land_code,
            },
            {
                $Type: 'UI.DataField',
                Value: status_code,
            },
        ],

    },

    UI.Facets    : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>AllgemeineInformation}',
            Target: '@UI.FieldGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Positionen.Plural}',
            Target: 'items/@UI.LineItem',
        },
    ]
);
