using main_sema as service from '../../../srv/main_service';

/*
SelectionFields
*/
annotate service.Positionen with @UI.SelectionFields: [
    ID,
    descr,
    product,
];

/*
LineItem
*/
annotate service.Positionen with @UI.LineItem: [
    {
        $Type         : 'UI.DataFieldWithIntentBasedNavigation',
        Value         : ID,
        SemanticObject: 'Semabelege',
        Action        : 'view-position',
        // Test part 3 when basics are fixed
        // Mapping       : [
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : up__Beleg,
        //         SemanticObjectProperty: 'Beleg',
        //     },
        //     {
        //         $Type                 : 'Common.SemanticObjectMappingType',
        //         LocalProperty         : Position,
        //         SemanticObjectProperty: 'Position',
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
        Value: descr,
    },
    {
        $Type: 'UI.DataField',
        Value: product
    },
];

/*
UI
*/
annotate service.Positionen with @(
    UI.FieldGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Value: descr,
            },
            {
                $Type: 'UI.DataField',
                Value: product,
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
            Label : '{i18n>Arbeitsschritte.Plural}',
            Target: 'steps/@UI.LineItem',
        },
    ]
);
