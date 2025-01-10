import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'about_us_model.dart';
export 'about_us_model.dart';

class AboutUsWidget extends StatefulWidget {
  const AboutUsWidget({super.key});

  @override
  State<AboutUsWidget> createState() => _AboutUsWidgetState();
}

class _AboutUsWidgetState extends State<AboutUsWidget> {
  late AboutUsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AboutUsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().htmlview =
          '<!DOCTYPE html><html lang=\"en\">  <head>    <meta charset=\"UTF-8\">    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">    <title>Terms & Conditions</title>    <style>      body {        font-family: Arial, sans-serif;        margin: 0;        padding: 0;        line-height: 1.6;        color: #333      }      header {        background: #f4f4f4;        padding: 20px;        text-align: center;        font-size: 24px      }      .container {        padding: 20px      }      h1,      h2 {        color: #444      }      ul {        list-style: disc;        margin: 10px 0 10px 20px      }    </style>  </head>  <body>    <header>Terms & Conditions</header>    <div class=\"container\">      <h1>Welcome to The Magic Ice Cream Factory</h1>      <p>Thank you for choosing The Magic Ice Cream Factory for your coffee and milkshake needs. By accessing or using our website <a href=\"https://themagicicecreamfactory.in\" target=\"_blank\">themagicicecreamfactory.in</a>, you agree to comply with and be bound by the following terms and conditions: </p>      <h2>1. Online Orders</h2>      <ul>        <li>All online orders are subject to availability.</li>        <li>Prices and product availability are subject to change without notice.</li>        <li>Orders will be confirmed after payment is successfully processed.</li>      </ul>      <h2>2. Payments</h2>      <ul>        <li>We accept UPI payments.</li>        <li>All payments must be made in full at the time of order.</li>        <li>We use secure payment gateways to protect your information.</li>      </ul>      <h2>5. User Responsibilities</h2>      <ul>        <li>Ensure that the Ordered Product is Corect.</li>        <li>Provide Token No to collect your order .</li>        <li>Do not misuse the website or engage in fraudulent activities.</li>      </ul>      <h2>6. Intellectual Property</h2>      <p>All content on this website, including text, images, and logos, is the property of The Magic Ice Cream Factory and is protected under applicable copyright laws.</p>      <h2>7. Limitation of Liability</h2>      <p>We are not liable for any damages arising from the use of our website or services, except as required by law.</p>      <h2>8. Changes to Terms & Conditions</h2>      <p>We reserve the right to update or modify these terms and conditions at any time without prior notice. Please review this page periodically for changes.</p>      <h2>Contact Us</h2>      <p>If you have any questions about these Terms & Conditions, please contact us at <a href=\"8275025168\">+918275025168</a>. </p>        <p>Last Updated: 10 Jan 2025</p>    </div>  </body></html>';
      FFAppState().colorab = 2;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'AboutUs',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().htmlview =
                                    '<h1><span style=\"font-size:18px\"><span style=\"color:#000000\">About us</span></span></h1><h2><span style=\"font-size:14px\">Business Name :<span style=\"font-size:16px\"><strong> </strong></span><strong><span style=\"color:#2c3e50\">Sensible Connect Solutions Pvt lmt</span></strong></span></h2><h3><span style=\"font-size:14px\">Business Description :</span><span style=\"font-size:20px\"> </span></h3><span style=\"font-size:12px\">Founded in 2016, Sensible Connect Solutions Pvt. Ltd. has become a highly regarded entity involved in manufacturing and wholesaling best series of Billing Machine, POS Machine, Weighing Scale, Weighing Systems and many more. These are widely acknowledged for their application specific design, accurate dimension, high performance, lightweight and durable finish standard.</span><h2><span style=\"font-size:14px\">Compact Billing Machine Series:</span></h2><span style=\"font-size:12px\">We provide compact billing solutions facing a point of sale for various retail &amp; wholesale applications. We offer supermarket billing software and restaurant billing software from India.<br />* Cloud software with free customisation<br />* Mobile Application with Reporting Features<br />* Quick Billing Mode with Hot Keys<br />* Software subscription starts from INR 3000 +gst per outlet/device per year.</span><h4><span style=\"font-size:10px\"><span style=\"color:#999999\">&nbsp;</span></span></h4>';
                                FFAppState().colorab = 1;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().colorab == 1
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'hr61zqxk' /* About Us */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().htmlview =
                                  '<!DOCTYPE html><html lang=\"en\">  <head>    <meta charset=\"UTF-8\">    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">    <title>Terms & Conditions</title>    <style>      body {        font-family: Arial, sans-serif;        margin: 0;        padding: 0;        line-height: 1.6;        color: #333      }      header {        background: #f4f4f4;        padding: 20px;        text-align: center;        font-size: 24px      }      .container {        padding: 20px      }      h1,      h2 {        color: #444      }      ul {        list-style: disc;        margin: 10px 0 10px 20px      }    </style>  </head>  <body>    <header>Terms & Conditions</header>    <div class=\"container\">      <h1>Welcome to The Magic Ice Cream Factory</h1>      <p>Thank you for choosing The Magic Ice Cream Factory for your coffee and milkshake needs. By accessing or using our website <a href=\"https://themagicicecreamfactory.in\" target=\"_blank\">themagicicecreamfactory.in</a>, you agree to comply with and be bound by the following terms and conditions: </p>      <h2>1. Online Orders</h2>      <ul>        <li>All online orders are subject to availability.</li>        <li>Prices and product availability are subject to change without notice.</li>        <li>Orders will be confirmed after payment is successfully processed.</li>      </ul>      <h2>2. Payments</h2>      <ul>        <li>We accept UPI payments.</li>        <li>All payments must be made in full at the time of order.</li>        <li>We use secure payment gateways to protect your information.</li>      </ul>      <h2>5. User Responsibilities</h2>      <ul>        <li>Ensure that the Ordered Product is Corect.</li>        <li>Provide Token No to collect your order .</li>        <li>Do not misuse the website or engage in fraudulent activities.</li>      </ul>      <h2>6. Intellectual Property</h2>      <p>All content on this website, including text, images, and logos, is the property of The Magic Ice Cream Factory and is protected under applicable copyright laws.</p>      <h2>7. Limitation of Liability</h2>      <p>We are not liable for any damages arising from the use of our website or services, except as required by law.</p>      <h2>8. Changes to Terms & Conditions</h2>      <p>We reserve the right to update or modify these terms and conditions at any time without prior notice. Please review this page periodically for changes.</p>      <h2>Contact Us</h2>      <p>If you have any questions about these Terms & Conditions, please contact us at <a href=\"8275025168\">+918275025168</a>. </p>        <p>Last Updated: 10 Jan 2025</p>    </div>  </body></html>';
                              safeSetState(() {});
                              FFAppState().colorab = 2;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().colorab == 2
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'epj8n2b0' /* Terms And Conditions */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (false)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().htmlview =
                                    '<h1><span style=\"font-size:18px\">Contact Us :</span></h1><h4><span style=\"font-size:14px\">Contact Person:</span> <span style=\"font-size:12px\">Amrut Nerlikar (Founder)</span><br /><span style=\"font-size:14px\">Contact Numbers:</span> <strong><span style=\"font-size:12px\"><span style=\"color:#2c3e50\">+91-9561673253</span> ,<span style=\"color:#2c3e50\">+91-8669695333</span></span></strong></h4><h3><span style=\"font-size:14px\">Address : </span></h3><span style=\"font-size:12px\">&nbsp; &nbsp; &nbsp; 4 Anand Complex Alkapuri Society,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opposite Kinara Hotel Near Vanaz Factory<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Paud Road<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kothrud<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pune, Maharashtra 411038<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; India</span><h4><span style=\"font-size:14px\">Website :&nbsp;&nbsp;</span><span style=\"color:#2c3e50\"><strong> <span style=\"font-size:12px\">https://www.sensibleconnect.com</span></strong></span></h4> <h4><span style=\"font-size:14px\">Email ID :&nbsp;&nbsp;</span><span style=\"color:#2c3e50\"><strong> <span style=\"font-size:12px\"> info@sensibleconnect.com</span></strong></span></h4>';
                                safeSetState(() {});
                                FFAppState().colorab = 3;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().colorab == 3
                                        ? FlutterFlowTheme.of(context).alternate
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '5w04qx7d' /* Contact Us */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().htmlview =
                                  '<!DOCTYPE html><html lang=\"en\"><head>    <meta charset=\"UTF-8\">    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">    <title>Privacy Policy</title>    <style>        body {            font-family: Arial, sans-serif;            margin: 0;            padding: 0;            line-height: 1.6;            color: #333;        }        header {            background: #f4f4f4;            padding: 20px;            text-align: center;            font-size: 24px;        }        .container {            padding: 20px;        }        h1, h2 {            color: #444;        }        ul {            list-style: disc;            margin: 10px 0 10px 20px;        }    </style></head><body>    <header>        Privacy Policy    </header>    <div class=\"container\">        <h1>Welcome to The Magic Ice Cream Factory</h1>        <p>Your privacy is important to us. This Privacy Policy outlines how we collect, use, and safeguard your information when you use our website <a href=\"https://themagicicecreamfactory.in\" target=\"_blank\">themagicicecreamfactory.in</a>.</p>        <h2>1. Information We Collect</h2>        <ul>            <li>Personal Information: Name, email address, phone number, and delivery address provided during the order process.</li>            <li>Payment Information: Payment details processed securely through our payment gateways.</li>            <li>Usage Data: Information about how you use our website, including IP address, browser type, and pages visited.</li>        </ul>        <h2>2. How We Use Your Information</h2>        <ul>            <li>To process and deliver your orders efficiently.</li>            <li>To communicate with you regarding your orders or inquiries.</li>            <li>To improve our website and services based on user feedback.</li>            <li>To comply with legal requirements and prevent fraudulent activities.</li>        </ul>        <h2>3. Sharing of Information</h2>        <ul>            <li>We do not sell or rent your personal information to third parties.</li>            <li>We may share your information with delivery partners to fulfill your orders.</li>            <li>Information may be disclosed if required by law or to protect our legal rights.</li>        </ul>        <h2>4. Security of Your Information</h2>        <p>We implement industry-standard security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, no online platform can guarantee complete security.</p>        <h2>5. Cookies</h2>        <p>Our website uses cookies to enhance your browsing experience. You can manage your cookie preferences through your browser settings.</p>        <h2>6. Third-Party Links</h2>        <p>Our website may contain links to third-party websites. We are not responsible for the privacy practices of these external sites and encourage you to review their policies.</p>        <h2>7. Changes to This Privacy Policy</h2>        <p>We reserve the right to update this Privacy Policy at any time. Any changes will be posted on this page with an updated \"Last Updated\" date.</p>               <p>Last Updated: 10 Jan 2025</p>    </div></body></html>';
                              safeSetState(() {});
                              FFAppState().colorab = 6;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().colorab == 6
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'kcz10syk' /* Privacy Policy */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().htmlview =
                                  '<!DOCTYPE html><html lang=\"en\">  <head>    <meta charset=\"UTF-8\">    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">    <style>      body {        font-family: Arial, sans-serif;        margin: 0;        padding: 0;        line-height: 1.6;        color: #333;      }      header {        background: #f4f4f4;        padding: 20px;        text-align: center;        font-size: 24px;      }      .container {        padding: 20px;      }      h1,      h2 {        color: #444;      }      ul {        list-style: disc;        margin: 10px 0 10px 20px;      }    </style>  </head>  <body>    <header> Cancellations & Refunds </header>    <div class=\"container\">      <ul>        <li>Orders once placed cannot be canceled if preparation has already started.</li>         <li>No return policy since the orders are perishable in nature.</li>           <li>On approvals, refund will be credited into your original payment methods within _ days.</li>        <li>Refunds will only be issued for valid reasons other wise no refunds available.</li>      </ul>    </div>  </body></html>';
                              safeSetState(() {});
                              FFAppState().colorab = 4;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().colorab == 4
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'o0i1ghlz' /* Cancellation and Refund Policy... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().htmlview =
                                  '<!DOCTYPE html><html lang=\"en\">  <head>    <meta charset=\"UTF-8\">    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">    <style>      body {        font-family: Arial, sans-serif;        margin: 0;        padding: 0;        line-height: 1.6;        color: #333;      }      header {        background: #f4f4f4;        padding: 20px;        text-align: center;        font-size: 24px;      }      .container {        padding: 20px;      }      h1,      h2 {        color: #444;      }      ul {        list-style: disc;        margin: 10px 0 10px 20px;      }    </style>  </head>  <body>    <header> Shipping And Delivery Policy </header>    <div class=\"container\">      <ul>          <li>Orders will be delivered instantly.</li>        <li>Delivery is available within the specified areas.</li>        <li>Estimated delivery times are provided but may vary due to unforeseen circumstances.</li>        <li>Pickup orders must be collected within the specified time frame mentioned during the checkout process.</li>      </ul>    </div>  </body></html>';
                              safeSetState(() {});
                              FFAppState().colorab = 5;
                              safeSetState(() {});
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.2,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().colorab == 5
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'x7wkohjs' /* Shipping and Delivery Policy */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 13,
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Html(
                                      data: FFAppState().htmlview,
                                      onLinkTap: (url, _, __) =>
                                          launchURL(url!),
                                    ),
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6gqhm43n' /* @copyright reserved  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              't8hzxsqd' /* THE MAGIC ICE CREAM FACTORY  */,
                                            ),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '28jmmi2s' /* 2025 All rights reserved */,
                                            ),
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
