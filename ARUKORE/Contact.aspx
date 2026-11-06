<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Contact.aspx.cs"
    Inherits="ARUKORE.Contact" %>

<asp:Content ID="ContactHead" ContentPlaceHolderID="HeadContent" runat="server">

    <!-- CONTACT PAGE SEO -->
    <meta name="description"
          content="Get in touch with Arun Kore - Junior Software Engineer, developer and content creator. Connect for software opportunities, collaborations and conversations." />

    <meta name="keywords"
          content="Arun Kore, ARU KORE, Contact Arun Kore, Software Engineer, Developer, GitHub, YouTube, Instagram, Collaboration" />

    <meta name="author" content="Arun Kore" />
    <meta name="robots" content="index, follow" />

    <link rel="canonical" href="https://arukore.in/Contact.aspx" />

    <!-- OPEN GRAPH -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Contact Arun Kore | ARU KORE" />
    <meta property="og:description"
          content="Have an opportunity, project idea or collaboration in mind? Let's connect with Arun Kore." />
    <meta property="og:url" content="https://arukore.in/Contact.aspx" />
    <meta property="og:site_name" content="ARU KORE" />
    <meta property="og:image"
          content="https://arukore.in/Content/images/aru-kore-social-preview.png" />
    <meta property="og:image:alt" content="ARU KORE - Arun Kore Personal Portfolio" />
    <meta property="og:image:type" content="image/png" />

    <!-- TWITTER / X -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Contact Arun Kore | ARU KORE" />
    <meta name="twitter:description"
          content="Let's connect, collaborate and create something meaningful." />
    <meta name="twitter:image"
          content="https://arukore.in/Content/images/aru-kore-social-preview.png" />

</asp:Content>


<asp:Content ID="ContactArea" ContentPlaceHolderID="MainContent" runat="server">

    <section class="contact-page">

        <!-- CONTACT HERO -->
        <div class="contact-hero">

            <div class="contact-heading">

                <p class="eyebrow">05 / LET'S CONNECT</p>

                <h1>GOT A PROJECT<br />
                    <span>IN YOUR MIND?</span>
                </h1>

                <p class="contact-intro">
                    Have an interesting opportunity, a project idea,
                    or just want to connect? My inbox is always open.
                </p>

                <div class="contact-availability">
                    <span class="availability-dot"></span>
                    OPEN TO OPPORTUNITIES & COLLABORATIONS
                </div>

            </div>

            <div class="contact-side-note">

                <span class="side-note-number">01 — 01</span>

                <p>
                    GOOD IDEAS<br />
                    START WITH<br />
                    A CONVERSATION.
                </p>

                <span class="side-note-arrow">↘</span>

            </div>

        </div>


        <!-- CONTACT CONTENT -->
        <div class="contact-layout">

            <!-- LEFT INFORMATION -->
            <div class="contact-information">

                <p class="contact-small-label">HAVE SOMETHING TO SAY?</p>

                <h2>Let's turn<br />
                    your idea into<br />
                    <span>something real.</span>
                </h2>

                <p class="contact-description">
                    Whether it's a software opportunity, collaboration,
                    feedback or a simple hello — feel free to drop me a message.
                </p>


                <!-- SOCIAL MEDIA LINKS -->
                <div class="contact-detail">

                    <span class="detail-label">INSTAGRAM</span>

                    <a href="https://www.instagram.com/aru__kore/"
                        target="_blank"
                        rel="noopener noreferrer">@aru__kore ↗
                    </a>

                </div>


                <div class="contact-detail">

                    <span class="detail-label">YOUTUBE</span>

                    <a href="https://www.youtube.com/channel/UCsl9tC3BhfCPOS09WEyYaIQ"
                        target="_blank"
                        rel="noopener noreferrer">ARU KORE - YouTube ↗
                    </a>

                </div>


                <div class="contact-detail">

                    <span class="detail-label">GITHUB</span>

                    <a href="https://github.com/arukore18"
                        target="_blank"
                        rel="noopener noreferrer">github.com/arukore18 ↗
                    </a>

                </div>


                <!-- LINKEDIN WILL BE ADDED LATER -->


                <div class="contact-detail">

                    <span class="detail-label">RESPONSE</span>

                    <p>
                        I'll get back to you as soon as possible.
                    </p>

                </div>


                <div class="contact-decoration">

                    <span>ARU KORE.</span>
                    <span>LET'S BUILD SOMETHING.</span>

                </div>

            </div>


            <!-- RIGHT CONTACT FORM -->
            <div class="contact-form-wrapper">

                <div class="form-heading">

                    <span class="form-index">01 / YOUR MESSAGE</span>

                    <h3>Drop me a line<span>.</span></h3>

                    <p>Fill in the details below.</p>

                </div>


                <div class="contact-form">

                    <!-- NAME -->
                    <div class="form-field">

                        <asp:Label runat="server"
                            AssociatedControlID="txtName"
                            Text="YOUR NAME" />

                        <asp:TextBox
                            ID="txtName"
                            runat="server"
                            MaxLength="100"
                            CssClass="form-control"
                            placeholder="Enter your name" />

                        <asp:RequiredFieldValidator
                            ID="rfvName"
                            runat="server"
                            ControlToValidate="txtName"
                            ErrorMessage="Please enter your name."
                            CssClass="validation"
                            Display="Dynamic" />

                    </div>


                    <!-- EMAIL -->
                    <div class="form-field">

                        <asp:Label runat="server"
                            AssociatedControlID="txtEmail"
                            Text="EMAIL ADDRESS" />

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            MaxLength="150"
                            TextMode="Email"
                            CssClass="form-control"
                            placeholder="you@example.com" />

                        <asp:RequiredFieldValidator
                            ID="rfvEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Please enter your email."
                            CssClass="validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ID="revEmail"
                            runat="server"
                            ControlToValidate="txtEmail"
                            ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                            ErrorMessage="Please enter a valid email address."
                            CssClass="validation"
                            Display="Dynamic" />

                    </div>


                    <!-- SUBJECT -->
                    <div class="form-field">

                        <asp:Label runat="server"
                            AssociatedControlID="txtSubject"
                            Text="SUBJECT" />

                        <asp:TextBox
                            ID="txtSubject"
                            runat="server"
                            MaxLength="150"
                            CssClass="form-control"
                            placeholder="What's this about?" />

                    </div>


                    <!-- MESSAGE -->
                    <div class="form-field">

                        <asp:Label runat="server"
                            AssociatedControlID="txtMessage"
                            Text="YOUR MESSAGE" />

                        <asp:TextBox
                            ID="txtMessage"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="6"
                            MaxLength="2000"
                            CssClass="form-control message-control"
                            placeholder="Tell me a little about your idea..." />

                        <asp:RequiredFieldValidator
                            ID="rfvMessage"
                            runat="server"
                            ControlToValidate="txtMessage"
                            ErrorMessage="Please enter a message."
                            CssClass="validation"
                            Display="Dynamic" />

                        <asp:RegularExpressionValidator
                            ID="revMessage"
                            runat="server"
                            ControlToValidate="txtMessage"
                            ValidationExpression="^[\s\S]{0,2000}$"
                            ErrorMessage="Message must be 2000 characters or fewer."
                            CssClass="validation"
                            Display="Dynamic" />

                    </div>


                    <!-- SUBMIT -->
                    <div class="form-submit-area">

                        <asp:Button
                            ID="btnSend"
                            runat="server"
                            Text="SEND MESSAGE  →"
                            CssClass="btn-primary contact-submit"
                            OnClick="btnSend_Click" />

                        <span class="form-privacy">Your message will be sent securely.
                        </span>

                    </div>


                    <asp:Label
                        ID="lblStatus"
                        runat="server"
                        EnableViewState="false" />

                </div>

            </div>

        </div>

    </section>

</asp:Content>
