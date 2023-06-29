using ContactService from './contact-service';

annotate ContactService.Customers with {
    firstName   @title: 'First name' @mandatory @assert.notNull;    
    lastName    @title : 'Last name' @mandatory @assert.target;
    telephone   @title : 'Telephone'        @Communication.IsPhoneNumber        @assert.format : '^\+[0-9]+[-]?[0-9]+$'  @UI.Placeholder: '+11111111-111';
    email       @title : 'Email'            @Communication.IsEmailAddress;
}
