import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../data/models/wedding_config_model.dart';

class PdfInvitationService {
  static Future<void> downloadInvitationPdf(WeddingConfig config) async {
    final pdf = pw.Document();

    final royalMaroon = PdfColor.fromHex('800020');
    final antiqueGold = PdfColor.fromHex('C9A44C');
    final ivoryBg = PdfColor.fromHex('FFF9EF');
    final darkBrown = PdfColor.fromHex('38251F');

    final titleFont = await PdfGoogleFonts.cinzelDecorativeBold();
    final bodyFont = await PdfGoogleFonts.cormorantGaramondRegular();
    final boldFont = await PdfGoogleFonts.cormorantGaramondBold();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Container(
            decoration: pw.BoxDecoration(
              color: ivoryBg,
              border: pw.Border.all(color: antiqueGold, width: 3),
              borderRadius: pw.BorderRadius.circular(16),
            ),
            padding: const pw.EdgeInsets.all(28),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  children: [
                    pw.Text(
                      '~ IN GOD’S GRACE & LOVE ~',
                      style: pw.TextStyle(
                        font: bodyFont,
                        fontSize: 12,
                        color: antiqueGold,
                        fontWeight: pw.FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      '"What God has joined together, let no one separate." – Mark 10:9',
                      style: pw.TextStyle(
                        font: bodyFont,
                        fontSize: 9,
                        fontStyle: pw.FontStyle.italic,
                        color: darkBrown,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      config.invitationTitle,
                      style: pw.TextStyle(
                        font: titleFont,
                        fontSize: 16,
                        color: royalMaroon,
                        letterSpacing: 2,
                      ),
                    ),
                    pw.SizedBox(height: 16),
                    pw.Text(
                      '${config.groomName}  &  ${config.brideName}',
                      style: pw.TextStyle(
                        font: titleFont,
                        fontSize: 28,
                        color: royalMaroon,
                      ),
                    ),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      '"${config.invitationSubtitle}"',
                      style: pw.TextStyle(
                        font: bodyFont,
                        fontSize: 13,
                        fontStyle: pw.FontStyle.italic,
                        color: darkBrown,
                      ),
                    ),
                    pw.SizedBox(height: 14),
                    pw.Container(
                      height: 1.5,
                      width: 250,
                      color: antiqueGold,
                    ),
                  ],
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(horizontal: 24),
                  child: pw.Text(
                    config.invitationMessage,
                    textAlign: pw.TextAlign.center,
                    style: pw.TextStyle(
                      font: bodyFont,
                      fontSize: 14,
                      color: darkBrown,
                      lineSpacing: 4,
                    ),
                  ),
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      'WEDDING ITINERARY & CELEBRATIONS',
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 13,
                        color: royalMaroon,
                        letterSpacing: 1.5,
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    ...config.events.map((e) {
                      return pw.Container(
                        margin: const pw.EdgeInsets.only(bottom: 10),
                        padding: const pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: antiqueGold, width: 0.8),
                          borderRadius: pw.BorderRadius.circular(8),
                        ),
                        child: pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Expanded(
                              flex: 2,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    e.name,
                                    style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 14,
                                      color: royalMaroon,
                                    ),
                                  ),
                                  pw.Text(
                                    e.venue,
                                    style: pw.TextStyle(
                                      font: bodyFont,
                                      fontSize: 11,
                                      color: darkBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.Expanded(
                              flex: 1,
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.end,
                                children: [
                                  pw.Text(
                                    '${e.dateTime.day}/${e.dateTime.month}/${e.dateTime.year}',
                                    style: pw.TextStyle(
                                      font: boldFont,
                                      fontSize: 12,
                                      color: antiqueGold,
                                    ),
                                  ),
                                  pw.Text(
                                    e.timeDisplay,
                                    style: pw.TextStyle(
                                      font: bodyFont,
                                      fontSize: 11,
                                      color: darkBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Text(
                      'Warmly Invited by Sanjay & Benita',
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 13,
                        color: royalMaroon,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'Sanjay_and_Benita_Wedding_Invitation.pdf',
    );
  }
}
