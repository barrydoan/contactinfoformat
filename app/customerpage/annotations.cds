using from '../../srv/contact-service';
using from '../../db/schema';

annotate ContactService.Customers with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: firstName,
        Label: '{i18n>firstname}',
    },
    {
        $Type: 'UI.DataField',
        Value: lastName,
        Label: '{i18n>lastname}',
    },
    {
        $Type: 'UI.DataField',
        Value: manager,
        Label: '{i18n>Manager}',
    },
    {
        $Type     : 'UI.DataField',
        Value     : telephone,
        Label     : '{i18n>telephone}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type     : 'UI.DataField',
        Value     : email,
        Label     : '{i18n>email}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type: 'UI.DataField',
        Value: visibleContactDetail,
        Label: '{i18n>visiblecontactdetail}',
    },
    {
        $Type: 'UI.DataField',
        Value: comment,
        Label: '{i18n>comment}',
    },
]);

annotate ContactService.Customers with @(
    UI.Facets               : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'collectionFacetSection',
        Label : '{i18n>collectionSection}',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Customer',
                ID    : 'Customer',
                Target: '@UI.FieldGroup#Customer1',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'RichText',
                ID    : 'RichText',
                Target: '@UI.FieldGroup#richText',
            }

        ],
    }, ],
    UI.FieldGroup #Customer1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstName,
                Label: '{i18n>firstname}',
            },
            {
                $Type: 'UI.DataField',
                Value: lastName,
                Label: '{i18n>lastname}',
            },
            {
                $Type: 'UI.DataField',
                Value: manager,
                Label: '{i18n>Manager}',
            },
            {
                $Type     : 'UI.DataField',
                Value     : telephone,
                Label     : '{i18n>telephone}',
                @UI.Hidden: {$edmJson: {$Eq: [
                    {$Path: 'visibleContactDetail'},
                    false
                ]}}
            },
            {
                $Type     : 'UI.DataField',
                Value     : email,
                Label     : '{i18n>email}',
                @UI.Hidden: {$edmJson: {$Eq: [
                    {$Path: 'visibleContactDetail'},
                    false
                ]}}
            },
            {
                $Type: 'UI.DataField',
                Value: visibleContactDetail,
                Label: '{i18n>visiblecontactdetail}',
            },
        ],
    }
);

annotate ContactService.Customers with @(UI.HeaderInfo: {
    TypeName      : 'Customer',
    TypeNamePlural: 'Customers',
});

annotate ContactService.Customers with {
    manager @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Users',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: manager,
                    ValueListProperty: 'username',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'email',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'phone',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'website',
                },
            ],
        },
        Common.ValueListWithFixedValues: true
    )
};
