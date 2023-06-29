using ContactService from './contact-service';

annotate ContactService.Customers with {
    firstName  @mandatory;
    lastName   @mandatory;
    telephone  @Communication.IsPhoneNumber  @assert.format: '^\+[0-9]+[-]?[0-9]+$'  @UI.Placeholder: '+11111111-111';
    email      @Communication.IsEmailAddress;
}
