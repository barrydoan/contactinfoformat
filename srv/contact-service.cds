using {com.sap.contactinfo as my} from '../db/schema';

service ContactService {
    entity Customers as projection on my.Customers
    entity Users     as projection on my.Users
}
