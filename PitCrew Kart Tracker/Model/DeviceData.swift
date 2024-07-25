//
//  DeviceData.swift
//  PitCrew Kart Tracker
//
//  Created by Николай Щербаков on 23.07.2024.
//

import Foundation

final class DeviceData: Encodable {
    let vivisWork: Bool
    let gfdokPS: String
    let gdpsjPjg: String
    let poguaKFP: String?
    let gpaMFOfa: String?
    let gciOFm: String = "--"
    let bcpJFs: String
    let GOmblx: String?
    let G0pxum: String
    let Fpvbduwm: Bool
    let Fpbjcv: String?
    let StwPp: Bool
    let KDhsd: Bool
    let bvoikOGjs: Array<String>
    let gfpbvjsoM: Int
    let gfdosnb: Array<String>
    let bpPjfns: String?
    let biMpaiuf: Bool
    let oahgoMAOI: Bool
    
    init(vivisWork: Bool, gfdokPS: String, gdpsjPjg: String, poguaKFP: String?, gpaMFOfa: String?, bcpJFs: String, GOmblx: String?, G0pxum: String, Fpvbduwm: Bool, Fpbjcv: String?, StwPp: Bool, KDhsd: Bool, bvoikOGjs: Array<String>, gfpbvjsoM: Int, gfdosnb: Array<String>, bpPjfns: String?, biMpaiuf: Bool, oahgoMAOI: Bool) {
        self.vivisWork = vivisWork
        self.gfdokPS = gfdokPS
        self.gdpsjPjg = gdpsjPjg
        self.poguaKFP = poguaKFP
        self.gpaMFOfa = gpaMFOfa
        self.bcpJFs = bcpJFs
        self.GOmblx = GOmblx
        self.G0pxum = G0pxum
        self.Fpvbduwm = Fpvbduwm
        self.Fpbjcv = Fpbjcv
        self.StwPp = StwPp
        self.KDhsd = KDhsd
        self.bvoikOGjs = bvoikOGjs
        self.gfpbvjsoM = gfpbvjsoM
        self.gfdosnb = gfdosnb
        self.bpPjfns = bpPjfns
        self.biMpaiuf = biMpaiuf
        self.oahgoMAOI = oahgoMAOI
    }
}
