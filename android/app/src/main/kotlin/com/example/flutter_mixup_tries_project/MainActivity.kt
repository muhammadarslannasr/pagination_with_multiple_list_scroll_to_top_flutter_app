package com.example.flutter_mixup_tries_project

import android.os.Bundle
import android.os.PersistableBundle
import com.igaworks.ssp.AdPopcornSSP
import com.igaworks.ssp.AdPopcornSSPUserProperties
import com.igaworks.ssp.AdSize
import com.igaworks.ssp.BannerAnimType
import com.igaworks.ssp.SSPErrorCode
import com.igaworks.ssp.part.banner.AdPopcornSSPBannerAd
import com.igaworks.ssp.part.banner.listener.IBannerEventCallbackListener
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    var adPopcornBannerAd : AdPopcornSSPBannerAd? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Initialize the Flutter engine and set up the activity's UI
        initializeSdk()
        adPopcornBannerAd= findViewById<AdPopcornSSPBannerAd>(R.id.banner)
        adPopcornBannerAd = AdPopcornSSPBannerAd(this@MainActivity)
        adPopcornBannerAd?.placementId = "bNgZ4s21GoRCQXG"
        adPopcornBannerAd?.setAdSize(AdSize.BANNER_320x50)
        adPopcornBannerAd?.setRefreshTime(50)
        adPopcornBannerAd?.setNetworkScheduleTimeout(10)
        adPopcornBannerAd?.setBannerAnimType(BannerAnimType.SLIDE_LEFT)
        adPopcornBannerAd?.autoBgColor = false
        adPopcornBannerAd?.loadAd()// Defaults 'true'

        adPopcornBannerAd?.setBannerEventCallbackListener(object: IBannerEventCallbackListener {

            override fun OnBannerAdReceiveSuccess() {
                print("OnBannerAdReceiveSuccess")
            }

            override fun OnBannerAdReceiveFailed(sspErrorCode: SSPErrorCode) {
                print("OnBannerAdReceiveFailed: $sspErrorCode")
            }

            override fun OnBannerAdClicked () {
                print("OnBannerAdClicked")
            }
        })
    }

    override fun onDestroy() {
        super.onDestroy()
        AdPopcornSSP.destroy()
    }


    fun initializeSdk() {
        AdPopcornSSP.gdprConsentAvailable(false)

        if (AdPopcornSSP.isInitialized(this@MainActivity)) {
// Already SSP SDK initialized
        } else {
            AdPopcornSSP.init(this@MainActivity);
        }

        val userProperties = AdPopcornSSPUserProperties.Builder()
            .gender(0)
            .yob(1984)
            .language("KR")
            .country("KO")
            .build()
        AdPopcornSSP.setUserProperties(userProperties)
    }

}
