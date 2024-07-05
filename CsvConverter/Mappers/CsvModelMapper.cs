namespace CsvConverter.Mappers;

public class CsvModelMapper : ClassMap<CsvModel>
{
    public CsvModelMapper()
    {
        Map(m => m.Id).Name("id");
        Map(m => m.InvoiceNumber).Name("invoice_number");
        Map(m => m.ClientId).Name("client_id");
        Map(m => m.Description).Name("description");
        Map(m => m.NumberOfItems).Name("number_ofitems");
    }
}
