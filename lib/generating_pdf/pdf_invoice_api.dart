import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
import '../models/ticket.dart';
import 'pdf_api.dart';

class PdfInvoiceApi {
  static Future<File> generate(TickectModel ticket) async {
    final pdf = Document();

    final netImage = await networkImage(ticket.picture!);

    pdf.addPage(
      MultiPage(
        build: (context) => [
          buildTitle(ticket, netImage),
        ],
        footer: (context) => buildFooter(ticket),
      ),
    );

    return PdfApi.saveDocument(name: "my_invoice.pdf", pdf: pdf);
  }

  static Widget buildTitle(TickectModel ticket, ImageProvider netImage) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '3b3fa Tickets',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 0.9 * PdfPageFormat.cm),

        // =====
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket.name ?? "",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Date : ${ticket.date}',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              Text('Time: ${ticket.startTime} - ${ticket.endTime} gmt',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              Text('Town: ${ticket.city}',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              Text('Location: ${ticket.location}',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
              Text('Price: GHC ${ticket.price}',
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
          SizedBox(width: 30),
          Container(
            height: 250,
            width: 250,
            color: PdfColors.brown,
            child: Image(netImage),
          ),
        ]),
        Text('Ticket ID : ${ticket.id}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ))
      ]);

  static Widget buildFooter(TickectModel ticket) =>
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Divider(),
        SizedBox(height: 2 * PdfPageFormat.mm),
        Text('Contact ${ticket}')
      ]);
}
