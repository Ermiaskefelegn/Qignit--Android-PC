package com.example.qignit_music_player;

import android.content.Context;
import android.content.res.AssetManager;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Environment;
import android.view.View;
import android.widget.Button;

import androidx.annotation.NonNull;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
//    private final String KEY = "abc";
//    Button btn_Dec, btn_In;
//    byte[] incrept;
//    byte[] decrpt;
//
//    @Override
//    public void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//        ctx = this;
//        btn_Dec = (Button) findViewById(R.id.button2);
//        btn_In = (Button) findViewById(R.id.button1);
//        btn_Dec.setOnClickListener(btnDecListner);
//        btn_In.setOnClickListener(btnInListner);
//
//    }
//
//    public View.OnClickListener btnDecListner = new View.OnClickListener() {
//        public void onClick(View v) {
//            VincentFileCrypto simpleCrypto = new VincentFileCrypto();
//            try {
//                // decrypt the file here first argument is key and second is encrypted file which we get from SD card.
//                decrpt = simpleCrypto.decrypt(KEY, getAudioFileFromSdCard());
//                //play decrypted audio file.
//                playMp3(decrpt);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//
//        }
//
//    };
//    Context ctx;
//    public View.OnClickListener btnInListner = new OnClickListener() {
//        public void onClick(View v) {
//            VincentFileCrypto simpleCrypto = new VincentFileCrypto();
//            try {
//                // encrypt audio file send as second argument and corresponding key in first argument.
//                incrept = simpleCrypto.encrypt(KEY, getAudioFile());
//                //Store encrypted file in SD card of your mobile with name vincent.mp3.
//                FileOutputStream fos = new FileOutputStream(new File("/sdcard/vincent.mp3"));
//                fos.write(incrept);
//                fos.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//
//            }
//
//        }
//
//    };
//
//
//    /**
//     * @return byte array for encryption.
//     * @throws FileNotFoundException
//     */
//
//
//    public byte[] getAudioFile() throws FileNotFoundException
//
//    {
//
//        byte[] audio_data = null;
//
//        byte[] inarry = null;
//
//
//        AssetManager am = ctx.getAssets();
//
//        try {
//
//            InputStream is = am.open("Sleep Away.mp3"); // use recorded file instead of getting file from assets folder.
//
//            int length = is.available();
//
//            audio_data = new byte[length];
//
//
//            int bytesRead;
//
//            ByteArrayOutputStream output = new ByteArrayOutputStream();
//
//            while ((bytesRead = is.read(audio_data)) != -1)
//
//            {
//
//                output.write(audio_data, 0, bytesRead);
//
//            }
//
//            inarry = output.toByteArray();
//
//
//        } catch (IOException e) {
//
//            // TODO Auto-generated catch block
//
//            e.printStackTrace();
//
//        }
//
//
//        return inarry;
//
//    }
//
//
//    /**
//     * This method fetch encrypted file which is save in sd card and convert it in byte array after that this  file will be decrept.
//     *
//     * @return byte array of encrypted data for decription.
//     * @throws FileNotFoundException
//     */
//
//    public byte[] getAudioFileFromSdCard() throws FileNotFoundException
//    {
//        byte[] inarry = null;
//        try {
//            //getting root path where encrypted file is stored.
//            File sdcard = Environment.getExternalStorageDirectory();
//            File file = new File(sdcard, "vincent.mp3"); //Creating file object
//            //Convert file into array of bytes.
//            FileInputStream fileInputStream = null;
//            byte[] bFile = new byte[(int) file.length()];
//            fileInputStream = new FileInputStream(file);
//            fileInputStream.read(bFile);
//            fileInputStream.close();
//            inarry = bFile;
//        } catch (IOException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        return inarry;
//
//    }
//
//
//    /**
//     * This Method is used to play audio file after decrepting.
//     *
//     * @param mp3SoundByteArray : This is our audio file which will be play and it converted in byte array.
//     */
//
//    private void playMp3(byte[] mp3SoundByteArray) {
//
//        try {
//            // create temp file that will hold byte array
//            File tempMp3 = File.createTempFile("kurchina", "mp3", getCacheDir());
//            tempMp3.deleteOnExit();
//            FileOutputStream fos = new FileOutputStream(tempMp3);
//            fos.write(mp3SoundByteArray);
//            fos.close();
//            // Tried reusing instance of media player
//            // but that resulted in system crashes...
//            MediaPlayer mediaPlayer = new MediaPlayer();
//            FileInputStream fis = new FileInputStream(tempMp3);
//            mediaPlayer.setDataSource(fis.getFD());
//            mediaPlayer.prepareAsync();
//            mediaPlayer.start();
//        } catch (IOException ex) {
//            ex.printStackTrace();
//
//        }
//
//    }
    }