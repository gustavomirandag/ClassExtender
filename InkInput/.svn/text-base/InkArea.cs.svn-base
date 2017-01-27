//-------------------------------------------------------------------------
//
//  This is part of the Microsoft Tablet PC Platform SDK
//  Copyright (C) 2004 Microsoft Corporation
//  All rights reserved.
//
//  This source code is only intended as a supplement to the
//  Microsoft Tablet PC Platform SDK Reference and related electronic 
//  documentation provided with the Software Development Kit.
//  See these sources for more detailed information. 
//
//  File: InkArea.cs
//  Simple control that accepts either ink or text input, depending
//  on the capabilities of the user's machine.
//
//  This control checks whether the client's machine is ink-enabled.
//  If so, it uses an InkOverlay attached to a Panel for ink 
//  collection.  Otherwise, it defaults to using a textbox.
//
//  The features used are: InkOverlay, handwriting recognition, and
//  ink serialization.
//
//--------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

// The Ink namespace, which contains the Tablet PC Platform API
using Microsoft.Ink;

namespace InkInput
{

    /// <summary>
    /// The InkArea Sample Control class
    /// </summary>
    public partial class InkArea : UserControl
    {
        // Declare the control used for collecting blog input
        private Control inputArea = null;

        // Declare the InkOverlay used for collecting blog
        // input when the client's machine is ink-enabled.
        private InkOverlay inkOverlay = null;

        //InkOverlayEditingMode atual ou que estava sendo utilizado ao mudar o lado da caneta
        private InkOverlayEditingMode inkModeSaved = InkOverlayEditingMode.Ink;

        private ToolStrip toolStrip;
        private ToolStripButton toolStripCor;
        private ToolStripButton toolStripNovo;
        private ToolStripButton toolStripBorracha;
        private ToolStripButton toolStripCaneta;
        private ToolStripButton toolStripSelecao;
        private ToolStripSeparator toolStripSeparator2;
        private ToolStripSeparator toolStripSeparator1;

        #region Standard Template Code
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.Container components = null;
        #endregion

        public InkArea()
        {
            #region Standard Template Code
            // This call is required by the Windows.Forms Form Designer.
            InitializeComponent();
            #endregion

            // Attempt to create an InkOverlay and attach it to
            // a Panel control.  If successful, this client can 
            // support inking within a web page.  Otherwise, use a
            // Textbox for collecting blog input.
            try
            {
                inputArea = CreateInkCollectionSurface();
            }
            catch (FileNotFoundException)
            {
                inputArea = new TextBox();
                ((TextBox)inputArea).Multiline = true;
            }

            inputArea.Size = this.Size;
            
            // Add the control used for collecting blog input
            this.Controls.Add(inputArea);

        }

        #region Standard Template Code
        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (components != null)
                {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }
        #endregion

        #region Component Designer generated code
        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(InkArea));
            this.toolStrip = new System.Windows.Forms.ToolStrip();
            this.toolStripNovo = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripCaneta = new System.Windows.Forms.ToolStripButton();
            this.toolStripBorracha = new System.Windows.Forms.ToolStripButton();
            this.toolStripSelecao = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripCor = new System.Windows.Forms.ToolStripButton();
            this.toolStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip
            // 
            this.toolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripNovo,
            this.toolStripSeparator2,
            this.toolStripCaneta,
            this.toolStripBorracha,
            this.toolStripSelecao,
            this.toolStripSeparator1,
            this.toolStripCor});
            this.toolStrip.Location = new System.Drawing.Point(0, 0);
            this.toolStrip.Name = "toolStrip";
            this.toolStrip.Size = new System.Drawing.Size(150, 25);
            this.toolStrip.TabIndex = 0;
            this.toolStrip.Text = "toolStrip";
            // 
            // toolStripNovo
            // 
            this.toolStripNovo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripNovo.Image = ((System.Drawing.Image)(resources.GetObject("toolStripNovo.Image")));
            this.toolStripNovo.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripNovo.Name = "toolStripNovo";
            this.toolStripNovo.Size = new System.Drawing.Size(23, 22);
            this.toolStripNovo.Text = "&New";
            this.toolStripNovo.ToolTipText = "New";
            this.toolStripNovo.Click += new System.EventHandler(this.toolStripNovo_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripCaneta
            // 
            this.toolStripCaneta.Checked = true;
            this.toolStripCaneta.CheckState = System.Windows.Forms.CheckState.Checked;
            this.toolStripCaneta.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripCaneta.Image = ((System.Drawing.Image)(resources.GetObject("toolStripCaneta.Image")));
            this.toolStripCaneta.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripCaneta.Name = "toolStripCaneta";
            this.toolStripCaneta.Size = new System.Drawing.Size(23, 22);
            this.toolStripCaneta.Text = "Pen";
            this.toolStripCaneta.ToolTipText = "Pen";
            this.toolStripCaneta.Click += new System.EventHandler(this.toolStripCaneta_Click);
            // 
            // toolStripBorracha
            // 
            this.toolStripBorracha.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripBorracha.Image = ((System.Drawing.Image)(resources.GetObject("toolStripBorracha.Image")));
            this.toolStripBorracha.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripBorracha.Name = "toolStripBorracha";
            this.toolStripBorracha.Size = new System.Drawing.Size(23, 22);
            this.toolStripBorracha.Text = "Eraser";
            this.toolStripBorracha.ToolTipText = "Eraser";
            this.toolStripBorracha.Click += new System.EventHandler(this.toolStripBorracha_Click);
            // 
            // toolStripSelecao
            // 
            this.toolStripSelecao.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripSelecao.Image = ((System.Drawing.Image)(resources.GetObject("toolStripSelecao.Image")));
            this.toolStripSelecao.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripSelecao.Name = "toolStripSelecao";
            this.toolStripSelecao.Size = new System.Drawing.Size(23, 22);
            this.toolStripSelecao.Text = "Select";
            this.toolStripSelecao.ToolTipText = "Select";
            this.toolStripSelecao.Click += new System.EventHandler(this.toolStripSelecao_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
            // 
            // toolStripCor
            // 
            this.toolStripCor.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripCor.Image = ((System.Drawing.Image)(resources.GetObject("toolStripCor.Image")));
            this.toolStripCor.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripCor.Name = "toolStripCor";
            this.toolStripCor.Size = new System.Drawing.Size(23, 20);
            this.toolStripCor.Text = "Color";
            this.toolStripCor.ToolTipText = "Color";
            this.toolStripCor.Click += new System.EventHandler(this.toolStripCor_Click);
            // 
            // InkArea
            // 
            this.Controls.Add(this.toolStrip);
            this.Name = "InkArea";
            this.toolStrip.ResumeLayout(false);
            this.toolStrip.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion

        /// <summary>
        /// Event hander from this control's Resize event
        /// Updates the child control to have the same size.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnResize(EventArgs e)
        {
            if (null != inputArea)
            {
                int toolStripHeight = toolStrip.Height + 2;

                inputArea.Top = toolStripHeight;
                inputArea.Width = this.Size.Width;
                inputArea.Height = this.Size.Height - toolStripHeight;
            }
        }

        public void resize(int width, int height)
        {
            this.Width = width;
            this.Height = height;
        }

        /// <summary>
        /// Indicates whether inking is supported on the client machine.
        /// </summary>
        /// <returns>Returns true if inking is supported and false otherwise.</returns>
        public bool InkEnabled
        {
            get
            {
                return inkOverlay != null;
            }
        }

        /// <summary>
        /// If inking is supported, returns the serialized ink data.
        /// Otherwise, returns an empty string.
        /// </summary>
        public string gifInkData
        {
            get
            {
                if (InkEnabled)
                {
                    return SerializeInkDataToGif();
                }
                else
                {
                    return String.Empty;
                }
            }
        }

        /// <summary>
        /// If inking is supported, returns the serialized ink data.
        /// Otherwise, returns an empty string.
        /// </summary>
        public string isfInkData
        {
            get
            {
                if (InkEnabled)
                {
                    return SerializeInkDataToIsf();
                }
                else
                {
                    return String.Empty;
                }
            }
        }

        /// <summary>
        /// If inking is supported, returns the recognized ink.
        /// Otherwise, returns the contents of the text box.
        /// </summary>
        public string TextData
        {
            get
            {
                if (InkEnabled)
                {
                    return RecognizeInkData();
                }
                else
                {
                    return ((TextBox)inputArea).Text;
                }
            }
        }

        /// <summary>
        /// Disposes of the internal child control used for collecting ink.
        /// </summary>
        public void DisposeResources()
        {
            if (InkEnabled)
            {
                inkOverlay.Dispose();
            }
        }


        #region Helper Methods (private)

        /// <summary>
        /// Attempts to create an InkOverlay and attach it to a
        /// Panel control.  If unable to create the InkOverlay, 
        /// an exception is thrown.
        /// </summary>
        /// <returns>Control to be used for this inking area</returns>
        protected Control CreateInkCollectionSurface()
        {
            try
            {
                Panel inkPanel = new Panel();
                inkPanel.BorderStyle = BorderStyle.FixedSingle;
                inkOverlay = new InkOverlay(inkPanel);
                inkOverlay.Enabled = true;
                inkOverlay.CursorInRange +=new InkCollectorCursorInRangeEventHandler(inkCollector_CursorInRange);

                return inkPanel;
            }
            catch
            {
                throw;
            }
        }

        private void inkCollector_CursorInRange(object sender, InkCollectorCursorInRangeEventArgs e)
        {
            if (e.Cursor.Inverted == true)
            {
                if (inkOverlay.EditingMode != InkOverlayEditingMode.Delete)
                {
                    inkOverlay.EditingMode = InkOverlayEditingMode.Delete;
                }
            }
            else
            {
                if (inkOverlay.EditingMode == InkOverlayEditingMode.Delete)
                {
                    inkOverlay.EditingMode = inkModeSaved;
                }
            }
        }

        /// <summary>
        /// Serializes the ink data as GIF using a Base 64 string.
        /// </summary>
        /// <returns>Ink data as a GIF using a Base 64 string</returns>
        protected String SerializeInkDataToGif()
        {
            Debug.Assert(InkEnabled, null, "Client must be ink-enabled");

            // Obtain the ink associated with this control
            Ink ink = inkOverlay.Ink;

            // Serialize the ink
            if (ink.Strokes.Count > 0)
            {
                byte[] inkDataBytes = ink.Save(PersistenceFormat.Gif);
                return Convert.ToBase64String(inkDataBytes);
            }

            // Default to returning the empty string.
            return String.Empty;
        }

        /// <summary>
        /// Serializes the ink data as ISF using a Base 64 string.
        /// </summary>
        /// <returns>Ink data as a ISF using a Base 64 string</returns>
        protected String SerializeInkDataToIsf()
        {
            Debug.Assert(InkEnabled, null, "Client must be ink-enabled");

            // Obtain the ink associated with this control
            Ink ink = inkOverlay.Ink;

            // Serialize the ink
            if (ink.Strokes.Count > 0)
            {
                byte[] inkDataBytes = ink.Save(PersistenceFormat.InkSerializedFormat);
                return Convert.ToBase64String(inkDataBytes);
            }

            // Default to returning the empty string.
            return String.Empty;
        }


        /// <summary>
        /// Recognize ink data using the default recognizer.
        /// </summary>
        /// <returns>The string containing the top recognition result.</returns>
        protected String RecognizeInkData()
        {
            Debug.Assert(InkEnabled, null, "Client must be ink-enabled");

            // Obtain the ink associated with this control
            Ink ink = inkOverlay.Ink;

            if (ink.Strokes.Count > 0)
            {

                // Attempt to create a recognition context and use it to
                // retrieve the top alternate.
                try
                {
                    RecognizerContext recognizerContext = new RecognizerContext();
                    RecognitionStatus recognitionStatus;
                    recognizerContext.Strokes = ink.Strokes;
                    RecognitionResult recognitionResult = recognizerContext.Recognize(out recognitionStatus);
                    if ((recognitionStatus == RecognitionStatus.NoError) &&
                         (null != recognitionResult))
                    {
                        return recognitionResult.TopString;
                    }
                }
                catch (Exception)
                {
                    // An exception will occur if the client does not have
                    // any handwriting recognizers installed on their system.
                    // In this case, we default to returning an empty string. 
                }
            }

            return String.Empty;
        }

        public void loadIsfInkData(String strInkData)
        {
            byte[] inkDataBytes = Convert.FromBase64String(strInkData);
            Ink loadedInk = new Ink();

            loadedInk.Load(inkDataBytes);

            inkOverlay.Enabled = false;
            inkOverlay.Ink = loadedInk;
            inkOverlay.Enabled = false;
            toolStripCaneta_Click(this, new EventArgs());
            //inputArea.Invalidate();
        }

        /// <summary>
        /// Helper method to create a GIF image file from the serialized ink data.
        /// Note:  since the ink data was serialized on the client side, the
        /// server does not need to have any specialized knowledge of ink.
        /// </summary>
        /// <param name="path">The location where the image should be created</param>
        /// <param name="fileName">The filename of the image</param>
        /// <param name="inkData">The serialized ink data</param>
        public void CreateGif(String path, String fileName, String inkBody)
        {
            String gifFilePath = Path.Combine(path, fileName + ".gif");
            using (FileStream fs = File.Create(gifFilePath))
            {
                byte[] bytes = Convert.FromBase64String(inkBody);
                fs.Write(bytes, 0, bytes.Length);
            }
        }
        #endregion

        private void toolStripCor_Click(object sender, EventArgs e)
        {
            ColorDialog colorDialog = new ColorDialog();
            DialogResult dialogResult;
            dialogResult = colorDialog.ShowDialog();

            if (dialogResult == DialogResult.OK)
            {
                inkOverlay.DefaultDrawingAttributes.Color = colorDialog.Color;
                toolStripCaneta_Click(sender, e);
            }


        }

        private void toolStripNovo_Click(object sender, EventArgs e)
        {
            inkOverlay.Enabled = false;
            inkOverlay.Ink.DeleteStrokes(inkOverlay.Ink.Strokes);
            inputArea.Invalidate();
            inkOverlay.Enabled = true;

        }

        private void toolStripBorracha_Click(object sender, EventArgs e)
        {
            inkOverlay.Enabled = false;
            toolStripBorracha.Checked = true;
            toolStripCaneta.Checked = false;
            toolStripSelecao.Checked = false;
            if ((!inkOverlay.CollectingInk))
            {
                inkOverlay.EraserWidth = 5;
                inkOverlay.EditingMode = InkOverlayEditingMode.Delete;
                inkModeSaved = InkOverlayEditingMode.Delete;
            }
            inkOverlay.Enabled = true;
        }

        private void toolStripCaneta_Click(object sender, EventArgs e)
        {
            inkOverlay.Enabled = false;
            toolStripCaneta.Checked = true;
            toolStripBorracha.Checked = false;
            toolStripSelecao.Checked = false;
            if ((!inkOverlay.CollectingInk))
            {
                inkOverlay.EditingMode = InkOverlayEditingMode.Ink;
                inkModeSaved = InkOverlayEditingMode.Ink;
            }
            inkOverlay.Enabled = true;
        }

        private void toolStripSelecao_Click(object sender, EventArgs e)
        {
            inkOverlay.Enabled = false;
            toolStripSelecao.Checked = true;
            toolStripCaneta.Checked = false;
            toolStripBorracha.Checked = false;
            if ((!inkOverlay.CollectingInk))
            {
                inkOverlay.EditingMode = InkOverlayEditingMode.Select;
                inkModeSaved = InkOverlayEditingMode.Select;
            }
            inkOverlay.Enabled = true;
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            inputArea.Width += 60;
            inputArea.Height += 60;

            this.Width += 60;
            this.Height += 60;
        }



    }
}

