//
//  StationDataDetails.swift
//  Tuju
//
//  Created by Eldwin Anthony on 21/10/22.
//

import Foundation
import UIKit

let pondokRanji = Station(namaStasiun: "Pondok Ranji", latitude: -6.2761221112337555, longitude: 106.74492972581243)
let kebayoran = Station(namaStasiun: "Kebayoran", latitude: -6.237100410964969, longitude: 106.78254607194879)
let manggarai = Station(namaStasiun: "Manggarai", latitude: -6.209675277806892, longitude: 106.85025771231817)

let palmerah = Station(namaStasiun: "Palmerah", latitude: -6.2071537130553835, longitude: 106.79744762581176)

let tanahAbang = Station(namaStasiun: "Tanah Abang", latitude: -6.185360771522169, longitude: 106.81099307183692)

let karet = Station(namaStasiun: "Karet", latitude: -6.200547009851408, longitude: 106.81575013745739)

let sudirman = Station(namaStasiun: "Sudirman", latitude: -6.201969746392874, longitude: 106.82321755464723)

let cikini = Station(namaStasiun: "Cikini", latitude: -6.198300308762655, longitude: 106.82321755464723)
let gondangdia = Station(namaStasiun: "Gondangdia", latitude: -6.185873336384879, longitude: 106.83268145464706)
let gambir = Station(namaStasiun: "Gambir", latitude: -6.176412531283551, longitude: 106.83059726814066)
let juanda = Station(namaStasiun: "Juanda", latitude: -6.166508260411192, longitude: 106.8305051834823)
let sawahBesar = Station(namaStasiun: "Sawah Besar", latitude: -6.160505991127654, longitude: 106.82763926814044)
let manggaBesar = Station(namaStasiun: "Mangga Besar", latitude: -6.149582587811262, longitude: 106.82694382396323)

let matraman = Station(namaStasiun: "Matraman", latitude: -6.21201398124878, longitude: 106.86029933930554)
let jatinegara = Station(namaStasiun: "Jatinegara", latitude: -6.214925343036553, longitude: 106.87030561231829)

let tebet = Station(namaStasiun: "Tebet", latitude: 6.225356018591745, longitude: 106.85899364115377)
let cawang = Station(namaStasiun: "Cawang", latitude: -6.242260930137949, longitude: 106.85878466814137)
let durenKalibata = Station(namaStasiun: "Duren Kalibata", latitude: -6.25518778602565, longitude: 106.8550798123186)
let pasarMingguBaru = Station(namaStasiun: "Pasar Minggu Baru", latitude: -6.262559664090336, longitude: 106.85184385464775)
let pasarMinggu = Station(namaStasiun: "Pasar Minggu", latitude: -6.284010879311879, longitude: 106.84451421047072)
let tanjungBaarat = Station(namaStasiun: "Tanjung Barat", latitude: -6.3077286259516985, longitude: 106.83887311601525)


var Hijau: [Station] = [
    pondokRanji,
    kebayoran,
    palmerah,
    tanahAbang
]

var BiruKiri: [Station] = [
    karet,
    sudirman,
    manggarai
]

var MerahAtas: [Station] = [
    manggarai,
    cikini,
    gondangdia,
    gambir,
    juanda,
    sawahBesar,
    manggaBesar
]

var BiruKanan: [Station] = [
    manggarai,
    matraman,
    jatinegara
]

var MerahBawah: [Station] = [
    manggarai,
    tebet,
    cawang,
    durenKalibata,
    pasarMingguBaru,
    pasarMinggu,
    tanjungBaarat
]
