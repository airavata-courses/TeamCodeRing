import java.io.FileOutputStream;
import java.io.PrintStream;
import ucar.nc2.NCdump;
import ucar.nc2.constants.FeatureType;
import ucar.nc2.dt.RadialDatasetSweep;
import ucar.nc2.dt.TypedDatasetFactory;
import ucar.nc2.util.CancelTask;
package src.main.scala.com.sga.readNexRadData;
public class ParseNexradData {

   public static void main(String[] args) {

      try {        

        String inpFile = "H://IUB//KABR20100211_065128_V03.gz";
        FileOutputStream fileOS = new FileOutputStream("H://IUB//output.txt");
        PrintStream printS = new PrintStream(fileOS);
        
        NCdump.print(inpFile, System.out);
        CancelTask cancelTask = new CancelTask() {
            public boolean isCancel() {
                return false;
            }
            public void setError(String arg0) {
            }
			@Override
			public void setProgress(String arg0, int arg1) {
								
			}
        };
       
        RadialDatasetSweep radialData = (RadialDatasetSweep)
            TypedDatasetFactory.open(
               FeatureType.RADIAL, 
               inpFile, 
               cancelTask,
               new StringBuilder()
            );


        String stationID      = radialData.getRadarID();
        String stationName    = radialData.getRadarName();
        boolean isVolume       = radialData.isVolume();

        radialData.getCommonOrigin());



        RadialDatasetSweep.RadialVariable varRef =
            (RadialDatasetSweep.RadialVariable) 
               radialData.getDataVariable("Reflectivity");


        int sweepNum = 0;
        RadialDatasetSweep.Sweep sweep = 
            varRef.getSweep(sweepNum);

        float meanElev = sweep.getMeanElevation();
        int nrays = sweep.getRadialNumber();
        float beamWidth = sweep.getBeamWidth();
        int ngates = sweep.getGateNumber();
        float gateSize = sweep.getGateSize();

        for (int i = 0; i < nrays; i++) {
             float azimuth = sweep.getAzimuth(i);
             float elevation = sweep.getElevation(i);
             float[] data = sweep.readData(i);
         }
       
      } catch (Exception e) {
          e.printStackTrace();
      }
   }

}
