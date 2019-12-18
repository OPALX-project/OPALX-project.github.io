// A simple example demonstrating the use of H5PartROOT as a shared library
// Run it in an interactive root session like this (make sure you have file
// called example.h5):
//    
//   .x example.C 
//
// To get the shared library, you must compile H5PartROOT with 'gmake shlib'.
// Be sure that the underlying H5Part has been compiled with the -fPIC option.
// If not, reconfigure your H5Part like this (bash shell):
//   cd $H5Part
//   ./autogen.sh
//   CFLAGS = -fPIC ./config
//   make
// 
{
  // load the shared library:
  if (TString(gSystem->GetBuildArch()) == TString("macosx64"))
    gSystem->Load("libh5root.dylib");
  else
    gSystem->Load("libh5root.so");

  // let's do it in style:
  TH5Style::SetStyle();

  // load the data file:
  TH5Dataset data("example.h5");

  // for convenience, get a dummy canvas for plotting
  TCanvas* dummy = new TCanvas("dummy","dummy",10, 10);      

  // get a 2D x-y histogram for step 10:
  TH2D* histo100 = data.Histo2d("x","y",10,-0.02,0.02,-0.02,0.02);
  // get a 2D x-y histogram for step 20:
  TH2D* histo200 = data.Histo2d("x","y",20,-0.02,0.02,-0.02,0.02);

  delete dummy;

  // embellish the histograms at wish and draw it with the desired 
  // drawing option:
  histo100->SetLabelSize(0.04,"X");
  histo100->SetLabelSize(0.04,"Y");
  histo100->SetLabelSize(0.04,"Z");
  histo200->SetLabelSize(0.04,"X");
  histo200->SetLabelSize(0.04,"Y");
  histo200->SetLabelSize(0.04,"Z");

  // get a fresh canvas, tune it as you like
  TCanvas* myCanv = new TCanvas("myCanv","H5PartROOT",1000, 750);  
  myCanv->Divide(1,2);
  myCanv_1->Divide(2,1);
  myCanv_1->cd(1);
  gPad->SetRightMargin(0.35);
  gPad->SetLeftMargin(0.15);
  myCanv_1->cd(2);
  gPad->SetRightMargin(0.35);
  gPad->SetLeftMargin(0.15);

  myCanv_1->cd(1);
  histo100->Draw("colz");
  myCanv_1->cd(2);
  histo200->Draw("colz");

  // example of a line plot:
  TGraph* emitt = data.GetGraphXY("SPOS","emittance(x,px)");
  myCanv_2->cd();
  myCanv_2->SetRightMargin(0.15);

  Double_t smin = TMath::MinElement(emitt->GetN(),emitt->GetX());
  Double_t smax = TMath::MaxElement(emitt->GetN(),emitt->GetX());
  Double_t emin = TMath::MinElement(emitt->GetN(),emitt->GetY());
  Double_t emax = TMath::MaxElement(emitt->GetN(),emitt->GetY()); 
  TH5Util::AddMargin(smin,smax);
  TH5Util::AddMargin(emin,emax);
  TH1F *frame = myCanv_2->DrawFrame(smin,0.,smax,emax);
  frame->SetXTitle("s [m]");
  frame->SetYTitle("#varepsilon_{x} [mm mrad]");
  
  emitt->Draw("LPsame");
  myCanv->Update();

  myCanv->Print("example.pdf");
  myCanv->Print("example.jpg");

}
