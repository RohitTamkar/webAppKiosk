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
          '<h1><span style=\"font-size:18px\"><span style=\"color:#000000\">About us</span></span></h1><h2><span style=\"font-size:14px\">Business Name :<span style=\"font-size:16px\"><strong> </strong></span><strong><span style=\"color:#2c3e50\">Sensible Connect Solutions Pvt lmt</span></strong></span></h2><h3><span style=\"font-size:14px\">Business Description :</span><span style=\"font-size:20px\"> </span></h3><span style=\"font-size:12px\">Founded in 2016, Sensible Connect Solutions Pvt. Ltd. has become a highly regarded entity involved in manufacturing and wholesaling best series of Billing Machine, POS Machine, Weighing Scale, Weighing Systems and many more. These are widely acknowledged for their application specific design, accurate dimension, high performance, lightweight and durable finish standard.</span><h2><span style=\"font-size:14px\">Compact Billing Machine Series:</span></h2><span style=\"font-size:12px\">We provide compact billing solutions facing a point of sale for various retail &amp; wholesale applications. We offer supermarket billing software and restaurant billing software from India.<br />* Cloud software with free customisation<br />* Mobile Application with Reporting Features<br />* Quick Billing Mode with Hot Keys<br />* Software subscription starts from INR 3000 +gst per outlet/device per year.</span><h4><span style=\"font-size:10px\"><span style=\"color:#999999\">&nbsp;</span></span></h4>';
      FFAppState().colorab = 1;
      safeSetState(() {});
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            content: Text(FFAppState().htmlview),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
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
                                        ? FlutterFlowTheme.of(context).primary
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
                                    '<p style=\"font-size:18px\" ><strong><B>Terms &amp; Conditions</B></strong></p>  <p>Last updated on Jan 30th 2024</p>  <p>For the purpose of these Terms and Conditions, The term &quot;we&quot;, &quot;us&quot;, &quot;our&quot; used anywhere on this page shall mean SENSIBLE CONNECT SOLUTIONS PRIVATE LIMITED, whose registered/operational office is Mayur Appartments, Survey     No 39/3, Plot No 4, Behind Mhatoba Mandir, Kothrud, Pune Pune MAHARASHTRA 411038 . &quot;you&quot;, &ldquo;your&rdquo;, &quot;user&quot;, &ldquo;visitor&rdquo; shall mean any natural or legal person who is visiting our website and/or agreed to purchase     from us.</p>  <p><B>Your use of the website and/or purchase from us are governed by following Terms and Conditions:</B></p>  <ul>     <li>The content of the pages of this website is subject to change without notice.</li>          <li>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that         such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.</li>     <li>Your use of any information or materials on our website and/or product pages is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through our         website and/or product pages meet your specific requirements.</li>     <li>Our website contains material which is owned by or licensed to us. This material includes, but are not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which         forms part of these terms and conditions.</li>     <li>All trademarks reproduced in our website which are not the property of, or licensed to, the operator are acknowledged on the website.</li>     <li>Unauthorized use of information provided by us shall give rise to a claim for damages and/or be a criminal offense.</li>     <li>From time to time our website may also include links to other websites. These links are provided for your convenience to provide further information.</li>     <li>You may not create a link to our website from another website or document without SENSIBLE CONNECT SOLUTIONS PRIVATE LIMITED&rsquo;s prior written consent.</li>     <li>Any dispute arising out of use of our website and/or purchase with us and/or any engagement with us is subject to the laws of India .</li>     <li>We, shall be under no liability whatsoever in respect of any loss or damage arising directly or indirectly out of the decline of authorization for any Transaction, on Account of the Cardholder having exceeded the preset limit mutually agreed by us with our acquiring bank from time to time</li> </ul>';
                                safeSetState(() {});
                                FFAppState().colorab = 2;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().colorab == 1
                                        ? FlutterFlowTheme.of(context).primary
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
                                    FFAppState().colorab == 1
                                        ? FlutterFlowTheme.of(context).primary
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
                                    '<p style=\"font-size:18px\"><b>Cancellation &amp; Refund Policy</b></p>  <p>Last updated on Jan 30th 2024</p>  <p>No cancellations &amp; Refunds are entertained</p>';
                                safeSetState(() {});
                                FFAppState().colorab = 4;
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
                                    '<p style=\"font-size:18px\"><b>Cancellation &amp; Refund Policy</b></p>  <p>Last updated on Jan 30th 2024</p>  <p>No cancellations &amp; Refunds are entertained</p>';
                                safeSetState(() {});
                                FFAppState().colorab = 5;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().colorab == 1
                                        ? FlutterFlowTheme.of(context).primary
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
                                    '<!DOCTYPE html>     <html>     <head>       <meta charset=\'utf-8\'>       <meta name=\'viewport\' content=\'width=device-width\'>       <title>Privacy Policy</title>       <style> body { font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; padding:1em; } </style>     </head>     <body>     <h2>Privacy Policy</h2> <p>                     Sensible Connect  built the Sensible Biz app as                     a Free app. This SERVICE is provided by                     Sensible Connect  at no cost and is intended for                     use as is.                   </p> <p>                     This page is used to inform visitors regarding                     our policies with the collection, use, and                     disclosure of Personal Information if anyone decided to use                     our Service.                   </p> <p>                     If you choose to use our Service, then you agree                     to the collection and use of information in relation to this                     policy. The Personal Information that we collect is                     used for providing and improving the Service.                     We will not use or share your                     information with anyone except as described in this Privacy                     Policy.                   </p> <p>                     The terms used in this Privacy Policy have the same meanings                     as in our Terms and Conditions, which is accessible at                     Sensible Biz unless otherwise defined in this Privacy                     Policy.                   </p> <p><strong>Information Collection and Use</strong></p> <p>                     For a better experience, while using our Service,                     we may require you to provide us with certain                     personally identifiable information, including but not limited to Billing for retail outlets, restaurants &amp; grocery shops. Manage real time inventory with smart inventory solutions. Manage your franchisee business like a pro. Digital marketing tools from Sensible Biz is a catalyst to your brick &amp; mortar outlet. Reporting app will be give you key insights to build your business. Sensible AI tips is a game-changer for your business. Stay tuned, expect more as we hold the credibility to deliver sensible retail business management platform.. The                     information that we request will be                     retained by us and used as described in this privacy policy.                   </p> <p>                     The app does use third party services that may collect                     information used to identify you.                   </p> <div><p>                       Link to privacy policy of third party service providers                       used by the app                     </p> <ul><li><a href=\"https://www.google.com/policies/privacy/\" target=\"_blank\">Google Play Services</a></li><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></ul></div> <p><strong>Log Data</strong></p> <p>                     We want to inform you that whenever                     you use our Service, in a case of an error in the                     app we collect data and information (through third                     party products) on your phone called Log Data. This Log Data                     may include information such as your device Internet                     Protocol (“IP”) address, device name, operating system                     version, the configuration of the app when utilizing                     our Service, the time and date of your use of the                     Service, and other statistics.                   </p> <p><strong>Cookies</strong></p> <p>                     Cookies are files with a small amount of data that are                     commonly used as anonymous unique identifiers. These are                     sent to your browser from the websites that you visit and                     are stored on your device\'s internal memory.                   </p> <p>                     This Service does not use these “cookies” explicitly.                     However, the app may use third party code and libraries that                     use “cookies” to collect information and improve their                     services. You have the option to either accept or refuse                     these cookies and know when a cookie is being sent to your                     device. If you choose to refuse our cookies, you may not be                     able to use some portions of this Service.                   </p> <p><strong>Service Providers</strong></p> <p>                     We may employ third-party companies                     and individuals due to the following reasons:                   </p> <ul><li>To facilitate our Service;</li> <li>To provide the Service on our behalf;</li> <li>To perform Service-related services; or</li> <li>To assist us in analyzing how our Service is used.</li></ul> <p>                     We want to inform users of this                     Service that these third parties have access to your                     Personal Information. The reason is to perform the tasks                     assigned to them on our behalf. However, they are obligated                     not to disclose or use the information for any other                     purpose.                   </p> <p><strong>Security</strong></p> <p>                     We value your trust in providing us                     your Personal Information, thus we are striving to use                     commercially acceptable means of protecting it. But remember                     that no method of transmission over the internet, or method                     of electronic storage is 100% secure and reliable, and                     we cannot guarantee its absolute security.                   </p> <p><strong>Links to Other Sites</strong></p> <p>                     This Service may contain links to other sites. If you click                     on a third-party link, you will be directed to that site.                     Note that these external sites are not operated by                     us. Therefore, we strongly advise you to                     review the Privacy Policy of these websites.                     We have no control over and assume no                     responsibility for the content, privacy policies, or                     practices of any third-party sites or services.                   </p> <p><strong>Children’s Privacy</strong></p> <p>                     These Services do not address anyone under the age of 13.                     We do not knowingly collect personally                     identifiable information from children under 13. In the case                     we discover that a child under 13 has provided                     us with personal information,                     we immediately delete this from our servers. If you                     are a parent or guardian and you are aware that your child                     has provided us with personal information, please contact                     us so that we will be able to do                     necessary actions.                   </p> <p><strong>Changes to This Privacy Policy</strong></p> <p>                     We may update our Privacy Policy from                     time to time. Thus, you are advised to review this page                     periodically for any changes. We will                     notify you of any changes by posting the new Privacy Policy                     on this page. These changes are effective immediately after                     they are posted on this page.                   </p> <p><strong>Contact Us</strong></p> <p>                     If you have any questions or suggestions about                     our Privacy Policy, do not hesitate to contact                     us at amrut.nerlikar@sensibleconnect.com.                   </p> <p>                     This privacy policy page was created at                     <a href=\"https://privacypolicytemplate.net\" target=\"_blank\">privacypolicytemplate.net</a>                     and modified/generated by                     <a href=\"https://app-privacy-policy-generator.firebaseapp.com/\" target=\"_blank\">App Privacy Policy Generator</a></p>     </body>     </html>       ';
                                safeSetState(() {});
                                FFAppState().colorab = 6;
                                safeSetState(() {});
                              },
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.2,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.05,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    FFAppState().colorab == 1
                                        ? FlutterFlowTheme.of(context).primary
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
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 13,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
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
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                                't8hzxsqd' /* SENSIBLE CONNECT SOLUTIONS PRI... */,
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
                                                '28jmmi2s' /* 2024 All rights reserved */,
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
          ),
        ));
  }
}
