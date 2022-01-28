-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Sep 2021 pada 07.54
-- Versi server: 10.2.40-MariaDB-cll-lve
-- Versi PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thia2451_smm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aktifitas`
--

CREATE TABLE `aktifitas` (
  `id` int(4) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `aksi` enum('Masuk','Keluar') NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` varchar(6) NOT NULL,
  `judul_artikel` varchar(50) NOT NULL,
  `isi_artikel` text NOT NULL,
  `gambar` text NOT NULL,
  `nama_mustahiq` varchar(40) NOT NULL,
  `nama_admin` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bca`
--

CREATE TABLE `bca` (
  `id` varchar(10) NOT NULL,
  `user_id` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bca`
--

INSERT INTO `bca` (`id`, `user_id`, `password`) VALUES
('S1', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `icon` enum('PESANAN','LAYANAN','DEPOSIT','PENGGUNA','PROMO') COLLATE utf8_swedish_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` enum('INFO','PERINGATAN','PENTING') COLLATE utf8_swedish_ci NOT NULL,
  `konten` text COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `date`, `time`, `icon`, `title`, `tipe`, `konten`) VALUES
(10, '2021-08-16', '21:34:50', 'LAYANAN', 'HANYA DEMO', 'PENTING', 'Selamat Datang di Demo Okepedia . Tidak bisa buat order , Ini Hanya Demo . Jika Minat Silahkan WhatsApp : 085866501532');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cek_akun`
--

CREATE TABLE `cek_akun` (
  `id` int(10) NOT NULL,
  `saldo` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `cek_akun`
--

INSERT INTO `cek_akun` (`id`, `saldo`, `date`, `time`, `tipe`, `provider`) VALUES
(2009, 0, '2021-08-20', '10:15:10', 'TOP UP', 'DG-PULSA'),
(2012, 0, '2021-07-15', '21:52:01', 'SOSIAL MEDIA', 'IRVANKEDE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `child_panel`
--

CREATE TABLE `child_panel` (
  `id` int(10) NOT NULL,
  `service_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `layanan` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `status` enum('Aktiv','Non Aktiv') CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(25) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `pembuatan` date NOT NULL,
  `expired` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `child_panel`
--

INSERT INTO `child_panel` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `status`, `provider`, `tipe`, `server`, `pembuatan`, `expired`) VALUES
(1, '1', 'AS001', 'Child Panel', 'Child Panel', 'Child Panel', 150000, 'Aktiv', 'ASHPRO CENTER', 'Child Panel', 'ASHPRO CENTER', '2021-03-09', '2021-04-09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `kode_deposit` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `tipe` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `pengirim` varchar(250) NOT NULL,
  `penerima` varchar(100) NOT NULL,
  `catatan` text NOT NULL,
  `jumlah_transfer` int(255) NOT NULL,
  `get_saldo` varchar(250) NOT NULL,
  `metode_isi_saldo` enum('saldo_sosmed','saldo_top_up') NOT NULL,
  `jenis` enum('Otomatis','Manual') NOT NULL,
  `status` enum('Success','Pending','Error') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `amount` varchar(128) NOT NULL,
  `fee` varchar(128) NOT NULL,
  `checkout_url` varchar(128) NOT NULL,
  `payment_name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gopay`
--

CREATE TABLE `gopay` (
  `id` varchar(10) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `device` varchar(200) NOT NULL,
  `kode` varchar(100) NOT NULL,
  `token` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga_kode_undangan`
--

CREATE TABLE `harga_kode_undangan` (
  `id` int(2) NOT NULL,
  `level` varchar(50) NOT NULL,
  `harga` double NOT NULL,
  `saldo_sosmed` double NOT NULL,
  `saldo_top_up` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `harga_kode_undangan`
--

INSERT INTO `harga_kode_undangan` (`id`, `level`, `harga`, `saldo_sosmed`, `saldo_top_up`) VALUES
(1, 'Member', 20000, 0, 5000),
(2, 'Agen', 1000, 0, 35000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_layanan`
--

CREATE TABLE `kategori_layanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `kode` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `kategori_layanan`
--

INSERT INTO `kategori_layanan` (`id`, `nama`, `kode`, `tipe`, `server`) VALUES
(368, 'Youtube Likes / Comments /', 'Youtube Likes / Comments /', 'Sosial Media', ''),
(369, 'SoundCloud', 'SoundCloud', 'Sosial Media', ''),
(370, 'Pinterest', 'Pinterest', 'Sosial Media', ''),
(371, 'Telegram', 'Telegram', 'Sosial Media', ''),
(372, 'Instagram Views', 'Instagram Views', 'Sosial Media', ''),
(373, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story / Impressions / Saves /  Reach', 'Sosial Media', ''),
(374, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views / Impressions / Live / Comments', 'Sosial Media', ''),
(375, 'Website Traffic', 'Website Traffic', 'Sosial Media', ''),
(376, 'Instagram Live Video', 'Instagram Live Video', 'Sosial Media', ''),
(377, 'Instagram Likes / Likes + Impressions', 'Instagram Likes / Likes + Impressions', 'Sosial Media', ''),
(378, 'Twitter Poll Votes', 'Twitter Poll Votes', 'Sosial Media', ''),
(379, 'Spotify', 'Spotify', 'Sosial Media', ''),
(380, 'Facebook Page Likes', 'Facebook Page Likes', 'Sosial Media', ''),
(381, 'Website Traffic [Targeted]', 'Website Traffic [Targeted]', 'Sosial Media', ''),
(382, 'Instagram Likes', 'Instagram Likes', 'Sosial Media', ''),
(383, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes / Comments / Shares / Events', 'Sosial Media', ''),
(384, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers No Refill/Not Guaranteed', 'Sosial Media', ''),
(386, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Sosial Media', ''),
(387, 'Instagram TV', 'Instagram TV', 'Sosial Media', ''),
(388, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Sosial Media', ''),
(389, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia', 'Sosial Media', ''),
(390, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia', 'Sosial Media', ''),
(391, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Highlights / Profile Visits / Reach', 'Sosial Media', ''),
(392, 'Instagram Auto Likes [Per Minute] ', 'Instagram Auto Likes [Per Minute] ', 'Sosial Media', ''),
(393, 'Tiktok Followers', 'Tiktok Followers', 'Sosial Media', ''),
(394, 'Tiktok Likes', 'Tiktok Likes', 'Sosial Media', ''),
(395, 'Facebook Followers / Friends / Group Members', 'Facebook Followers / Friends / Group Members', 'Sosial Media', ''),
(396, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok  Views, Komentar , Like Komentar &Share ', 'Sosial Media', ''),
(397, 'Twitter Likes', 'Twitter Likes', 'Sosial Media', ''),
(398, 'Instagram Followers Indonesia PAKET REAL ', 'Instagram Followers Indonesia PAKET REAL ', 'Sosial Media', ''),
(399, 'Youtube Views', 'Youtube Views', 'Sosial Media', ''),
(400, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Sosial Media', ''),
(401, 'Youtube Live Stream', 'Youtube Live Stream', 'Sosial Media', ''),
(402, 'Facebook Video Views / Live Stream', 'Facebook Video Views / Live Stream', 'Sosial Media', ''),
(403, 'Youtube Watchtime', 'Youtube Watchtime', 'Sosial Media', ''),
(404, 'Youtube Subscribers ', 'Youtube Subscribers ', 'Sosial Media', ''),
(405, 'Twitter Followers', 'Twitter Followers', 'Sosial Media', ''),
(406, 'Instagram Story Indonesia', 'Instagram Story Indonesia', 'Sosial Media', ''),
(407, 'Instagram Comments', 'Instagram Comments', 'Sosial Media', ''),
(408, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views/Likes/Comments', 'Sosial Media', ''),
(409, 'P', 'P', 'Sosial Media', ''),
(411, 'Pulsa TELKOMSEL', 'Pulsa TELKOMSEL', 'Top Up', 'Pulsa'),
(412, 'Pulsa INDOSAT', 'Pulsa INDOSAT', 'Top Up', 'Pulsa'),
(413, 'Pulsa AXIS', 'Pulsa AXIS', 'Top Up', 'Pulsa'),
(414, 'Pulsa SMART', 'Pulsa SMART', 'Top Up', 'Pulsa'),
(415, 'Pulsa TRI', 'Pulsa TRI', 'Top Up', 'Pulsa'),
(416, 'Pulsa XL', 'Pulsa XL', 'Top Up', 'Pulsa'),
(417, 'Data SMART', 'Data SMART', 'Top Up', 'Data'),
(418, 'Games MOBILE LEGEND', 'Games MOBILE LEGEND', 'Top Up', 'Games'),
(419, 'PLN PLN', 'PLN PLN', 'Top Up', 'PLN'),
(420, 'Data INDOSAT', 'Data INDOSAT', 'Top Up', 'Data'),
(421, 'Voucher WIFI ID', 'Voucher WIFI ID', 'Top Up', 'Voucher'),
(422, 'Data TELKOMSEL', 'Data TELKOMSEL', 'Top Up', 'Data'),
(423, 'Data AXIS', 'Data AXIS', 'Top Up', 'Data'),
(424, 'Data TRI', 'Data TRI', 'Top Up', 'Data'),
(425, 'Games FREE FIRE', 'Games FREE FIRE', 'Top Up', 'Games'),
(426, 'Games PUBG MOBILE', 'Games PUBG MOBILE', 'Top Up', 'Games'),
(427, 'Games Call of Duty MOBILE', 'Games Call of Duty MOBILE', 'Top Up', 'Games'),
(428, 'Games Speed Drifters', 'Games Speed Drifters', 'Top Up', 'Games'),
(429, 'Games King of Kings', 'Games King of Kings', 'Top Up', 'Games'),
(430, 'Games Higgs Domino', 'Games Higgs Domino', 'Top Up', 'Games'),
(431, 'Games Boyaa Capsa Susun', 'Games Boyaa Capsa Susun', 'Top Up', 'Games'),
(432, 'Games Poker Texas', 'Games Poker Texas', 'Top Up', 'Games'),
(433, 'Games Ride Out Heroes', 'Games Ride Out Heroes', 'Top Up', 'Games'),
(434, 'Games LifeAfter Credits', 'Games LifeAfter Credits', 'Top Up', 'Games'),
(435, 'Games IndoPlay', 'Games IndoPlay', 'Top Up', 'Games'),
(436, 'Games Scroll of Onmyoji', 'Games Scroll of Onmyoji', 'Top Up', 'Games'),
(437, 'Games Marvel Super War', 'Games Marvel Super War', 'Top Up', 'Games'),
(438, 'Games HAGO', 'Games HAGO', 'Top Up', 'Games'),
(439, 'Games Valorant', 'Games Valorant', 'Top Up', 'Games'),
(440, 'Games Tom and Jerry : Chase', 'Games Tom and Jerry : Chase', 'Top Up', 'Games'),
(441, 'Games Sausage Man', 'Games Sausage Man', 'Top Up', 'Games'),
(442, 'Voucher GOOGLE PLAY INDONESIA', 'Voucher GOOGLE PLAY INDONESIA', 'Top Up', 'Voucher'),
(443, 'Voucher GOOGLE PLAY US REGION', 'Voucher GOOGLE PLAY US REGION', 'Top Up', 'Voucher'),
(444, 'Voucher ITUNES US REGION', 'Voucher ITUNES US REGION', 'Top Up', 'Voucher'),
(445, 'Voucher Steam Wallet (IDR)', 'Voucher Steam Wallet (IDR)', 'Top Up', 'Voucher'),
(446, 'Voucher SPOTIFY', 'Voucher SPOTIFY', 'Top Up', 'Voucher'),
(447, 'Voucher Unipin Voucher', 'Voucher Unipin Voucher', 'Top Up', 'Voucher'),
(448, 'Voucher Steam Wallet (USD)', 'Voucher Steam Wallet (USD)', 'Top Up', 'Voucher'),
(449, 'Voucher Dota Auto Chess Candy (Global)', 'Voucher Dota Auto Chess Candy (Global)', 'Top Up', 'Voucher'),
(450, 'Voucher Vidio', 'Voucher Vidio', 'Top Up', 'Voucher'),
(451, 'E-Money GO PAY', 'E-Money GO PAY', 'Top Up', 'E-Money'),
(452, 'E-Money OVO', 'E-Money OVO', 'Top Up', 'E-Money'),
(453, 'E-Money DANA', 'E-Money DANA', 'Top Up', 'E-Money'),
(454, 'E-Money TIX ID', 'E-Money TIX ID', 'Top Up', 'E-Money'),
(455, 'E-Money LinkAja', 'E-Money LinkAja', 'Top Up', 'E-Money'),
(456, 'E-Money SHOPEE PAY', 'E-Money SHOPEE PAY', 'Top Up', 'E-Money'),
(457, 'Paket SMS Telpon TELKOMSEL', 'Paket SMS Telpon TELKOMSEL', 'Top Up', 'Paket SMS Telpon'),
(458, 'Paket SMS Telpon INDOSAT', 'Paket SMS Telpon INDOSAT', 'Top Up', 'Paket SMS Telpon'),
(459, 'Paket SMS Telpon TRI', 'Paket SMS Telpon TRI', 'Top Up', 'Paket SMS Telpon'),
(460, 'Paket SMS Telpon XL', 'Paket SMS Telpon XL', 'Top Up', 'Paket SMS Telpon'),
(461, 'TV ORANGE TV', 'TV ORANGE TV', 'Top Up', 'TV'),
(462, 'TV k-vision', 'TV k-vision', 'Top Up', 'TV'),
(463, 'TV Decoder GOL', 'TV Decoder GOL', 'Top Up', 'TV'),
(464, 'TV Transvision', 'TV Transvision', 'Top Up', 'TV'),
(465, 'Pulsa Internasional CHINA TOPUP', 'Pulsa Internasional CHINA TOPUP', 'Top Up', 'Pulsa Internasional'),
(466, 'Pulsa Internasional MAXIS', 'Pulsa Internasional MAXIS', 'Top Up', 'Pulsa Internasional'),
(467, 'Pulsa Internasional SMART PINOY', 'Pulsa Internasional SMART PINOY', 'Top Up', 'Pulsa Internasional'),
(468, 'Pulsa Internasional SINGTEL', 'Pulsa Internasional SINGTEL', 'Top Up', 'Pulsa Internasional'),
(469, 'Pulsa Internasional THAILAND TOPUP', 'Pulsa Internasional THAILAND TOPUP', 'Top Up', 'Pulsa Internasional'),
(470, 'Voucher TELKOMSEL', 'Voucher TELKOMSEL', 'Top Up', 'Voucher'),
(471, 'Voucher AXIS', 'Voucher AXIS', 'Top Up', 'Voucher'),
(472, 'Voucher SMART', 'Voucher SMART', 'Top Up', 'Voucher'),
(473, 'Voucher TRI', 'Voucher TRI', 'Top Up', 'Voucher'),
(474, 'Pulsa by.U', 'Pulsa by.U', 'Top Up', 'Pulsa'),
(475, 'Data XL', 'Data XL', 'Top Up', 'Data'),
(476, 'E-Money Mitra Shopee', 'E-Money Mitra Shopee', 'Top Up', 'E-Money'),
(477, 'E-Money Sakuku', 'E-Money Sakuku', 'Top Up', 'E-Money'),
(478, 'Voucher POINT BLANK', 'Voucher POINT BLANK', 'Top Up', 'Voucher'),
(479, 'Voucher PUBG', 'Voucher PUBG', 'Top Up', 'Voucher'),
(480, 'Voucher PUBG MOBILE', 'Voucher PUBG MOBILE', 'Top Up', 'Voucher'),
(481, 'E-Money MANDIRI E-TOLL', 'E-Money MANDIRI E-TOLL', 'Top Up', 'E-Money'),
(482, 'E-Money TAPCASH BNI', 'E-Money TAPCASH BNI', 'Top Up', 'E-Money'),
(483, 'E-Money BRI BRIZZI', 'E-Money BRI BRIZZI', 'Top Up', 'E-Money'),
(484, 'E-Money i.saku', 'E-Money i.saku', 'Top Up', 'E-Money'),
(485, 'Games GARENA', 'Games GARENA', 'Top Up', 'Games'),
(486, 'Games POINT BLANK', 'Games POINT BLANK', 'Top Up', 'Games'),
(487, 'Games Ragnarok M: Eternal Love', 'Games Ragnarok M: Eternal Love', 'Top Up', 'Games'),
(488, 'Games ARENA OF VALOR', 'Games ARENA OF VALOR', 'Top Up', 'Games'),
(489, 'Games AU2 MOBILE', 'Games AU2 MOBILE', 'Top Up', 'Games'),
(490, 'Games BOYAA DOMINO QIUQIU', 'Games BOYAA DOMINO QIUQIU', 'Top Up', 'Games'),
(491, 'Games Laplace M', 'Games Laplace M', 'Top Up', 'Games'),
(492, 'Games Lords Mobile', 'Games Lords Mobile', 'Top Up', 'Games'),
(493, 'Games Starpass', 'Games Starpass', 'Top Up', 'Games'),
(494, 'Games Knights of Valour', 'Games Knights of Valour', 'Top Up', 'Games'),
(495, 'Games DRAGON RAJA - SEA', 'Games DRAGON RAJA - SEA', 'Top Up', 'Games'),
(496, 'Games Bullet Angel', 'Games Bullet Angel', 'Top Up', 'Games'),
(497, 'Voucher MEGAXUS', 'Voucher MEGAXUS', 'Top Up', 'Voucher'),
(498, 'Voucher Razer Gold', 'Voucher Razer Gold', 'Top Up', 'Voucher'),
(499, 'Aktivasi Voucher INDOSAT', 'Aktivasi Voucher INDOSAT', 'Top Up', 'Aktivasi Voucher'),
(500, 'TV Nex & Garuda', 'TV Nex & Garuda', 'Top Up', 'TV'),
(501, 'Paket SMS Telpon AXIS', 'Paket SMS Telpon AXIS', 'Top Up', 'Paket SMS Telpon'),
(502, 'INTERNET PASCABAYAR', 'INTERNET PASCABAYAR', 'Pascabayar', 'Pascabayar'),
(503, 'PDAM', 'PDAM', 'Pascabayar', 'Pascabayar'),
(504, 'BPJS KESEHATAN', 'BPJS KESEHATAN', 'Pascabayar', 'Pascabayar'),
(505, 'TV PASCABAYAR', 'TV PASCABAYAR', 'Pascabayar', 'Pascabayar'),
(506, 'MULTIFINANCE', 'MULTIFINANCE', 'Pascabayar', 'Pascabayar'),
(507, 'PLN PASCABAYAR', 'PLN PASCABAYAR', 'Pascabayar', 'Pascabayar'),
(508, 'GAS NEGARA', 'GAS NEGARA', 'Pascabayar', 'Pascabayar'),
(509, 'PBB', 'PBB', 'Pascabayar', 'Pascabayar'),
(510, 'HP PASCABAYAR', 'HP PASCABAYAR', 'Pascabayar', 'Pascabayar'),
(511, '', '', 'Pascabayar', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ketentuan_layanan`
--

CREATE TABLE `ketentuan_layanan` (
  `id` int(2) NOT NULL,
  `nomer` varchar(50) NOT NULL,
  `tipe` varchar(25) NOT NULL,
  `konten` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ketentuan_layanan`
--

INSERT INTO `ketentuan_layanan` (`id`, `nomer`, `tipe`, `konten`, `date`, `time`) VALUES
(2, '2', 'layanan', '<h3>Umum</h3><br>\r\n<h4>Dengan Menggunakan Layanan Okepedia, Kami Anggap Anda Telah Membaca Ketentuan Layanan Ini</h4><br>\r\nDengan mendaftar dan menggunakan layanan Okepedia, Anda secara otomatis menyetujui semua ketentuan layanan kami. Kami berhak mengubah ketentuan layanan ini tanpa pemberitahuan terlebih dahulu. Anda diharapkan membaca semua ketentuan layanan kami sebelum membuat pesanan.<br><br>\r\n\r\nOkepedia tidak akan bertanggung jawab jika Anda mengalami kerugian dalam bisnis Anda.<br><br>\r\n\r\nOkepedia tidak bertanggung jawab jika Anda atau Client Anda mengalami suspensi akun atau penghapusan kiriman yang dilakukan oleh Instagram, Twitter, Facebook, Youtube, dan lain-lain<br><br>\r\n\r\nOkepedia berhak melakukan perubahan pada Ketentuan Layanan tanpa adanya pemberitahuan sebelumnya kepada anda sebelumnya.<br><br>\r\n\r\nOkepedia tidak bertanggung jawab atas penutupan akun atau penghapusan gambar yang dilakukan oleh Instagram / Facebook / Youtube / Social Media lainnya.<br><br>\r\n\r\nOkepedia tidak menjamin waktu pengiriman pesanan Anda. Kami selalu berusaha memberikan yang terbaik pada pesanan Anda saat dikirimkan. Dan kami tidak akan melakukan pengembalian dana meskipun pesanan anda membutuhkan waktu yang cukup lama untuk di proses.<br><br><br>\r\n\r\n<h3>Layanan</h3><br>\r\nOkepedia hanya digunakan untuk media promosi sosial media dan membantu meningkatkan penampilan akun Anda saja.<br><br>\r\n\r\nOkepedia tidak menjamin pengikut baru Anda berinteraksi dengan Anda, kami hanya menjamin bahwa Anda mendapat pengikut yang Anda beli.<br><br>\r\n\r\nOkepedia tidak menerima permintaan pembatalan/pengembalian dana setelah pesanan masuk ke sistem kami. Kami memberikan pengembalian dana yang sesuai jika pesanan tidak dapat diselesaikan atau Partial.<br><br>\r\n\r\nSOLUSIMEDIA tidak memberikan toleransi untuk akun yang ada pada kondisi privasi. Pastikan akun dalam kondisi publik sebelum melakukan pesanan<br><br>\r\n\r\n<h3>Pengembalian Dana</h3><br>\r\nTidak ada pencairan atau pengembalian dana pada saldo. Setelah melakukan deposit, tidak ada cara untuk mengembalikan dana tersebut. Anda harus menggunakannya untuk melakukan pesanan pada layanan kami.<br><br>\r\n\r\nAnda telah setuju bahwa setelah melakukan deposit Saldo. Anda tidak akan menuntut atau mengajukan sengketa melawan kami untuk alasan apapun.<br><br>\r\n\r\nJika Anda menuntut atau mengajukan sengketa kepada kami setelah deposit, kami berhak menutup akun Anda serta melarang Anda dari situs kami.<br><br>\r\n\r\nPesanan pada Okepedia yang sudah di pesan tidak dapat kami batalkan atau mengembalikan Saldo. Anda hanya mendapat pengembalian Saldo jika pesanan Anda tidak dapat diproses.<br><br>\r\n\r\nData pesanan yang salah atau akun yang di privasi tidak dapat kami refund. Pastikan untuk mengecek terlebih dahulu sebelum memesan layanan kami.<br><br>\r\n\r\nAktivitas pengisian Saldo menggunakan dana yang tidak sah atau dana penipuan akan menyebabkan penutupan pada akun Anda. Tidak ada pengecualian.<br><br>\r\n\r\nJangan menggunakan lebih dari satu layanan untuk data yang sama. Solusi Media tidak dapat memberikan jumlah followers / likes yang tepat pada kasus ini. Tidak ada refund.<br><br><br><br>\r\n\r\n\r\n<h5>Diperbaharui : 04 Juni 2021</h5>', '2021-06-15', '11:47:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_undangan`
--

CREATE TABLE `kode_undangan` (
  `id` int(10) NOT NULL,
  `level` enum('Member','Agen','Admin') COLLATE utf8_swedish_ci NOT NULL,
  `uplink` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `kode` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `saldo_sosmed` int(10) NOT NULL,
  `saldo_top_up` int(10) NOT NULL,
  `status` enum('Belum Dipakai','Sudah Dipakai') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kode_voucher`
--

CREATE TABLE `kode_voucher` (
  `id` int(11) NOT NULL,
  `pembuat` varchar(200) NOT NULL,
  `kode` varchar(200) NOT NULL,
  `jumlah` double NOT NULL,
  `status` enum('Belum Dipakai','Sudah Dipakai') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak_admin`
--

CREATE TABLE `kontak_admin` (
  `id` int(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` text NOT NULL,
  `deskripsi` text NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `jam_kerja` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `link_fb` varchar(100) NOT NULL,
  `link_ig` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kontak_admin`
--

INSERT INTO `kontak_admin` (`id`, `nama`, `jabatan`, `deskripsi`, `lokasi`, `jam_kerja`, `email`, `no_hp`, `link_fb`, `link_ig`) VALUES
(0, 'Okepedia', 'CS', 'Okepedia CENTER', 'Desa Cageur Kecamatan Darma Kabupaten Kuningan', '09.00 - 18.00', 'support@Okepedia.,my.id', '6285866501532', 'https://www.facebook.com/Okepedia', 'https://www.facebook.com/Okepedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak_website`
--

CREATE TABLE `kontak_website` (
  `id` int(11) NOT NULL,
  `logo` text NOT NULL,
  `link_fb` varchar(100) NOT NULL,
  `link_ig` varchar(100) NOT NULL,
  `no_wa` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kode_pos` int(11) NOT NULL,
  `jam_kerja` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kontak_website`
--

INSERT INTO `kontak_website` (`id`, `logo`, `link_fb`, `link_ig`, `no_wa`, `email`, `alamat`, `kode_pos`, `jam_kerja`) VALUES
(0, '', 'https://www.facebook.com/Okepedia', 'https://instagram.com/Okepedia', '6285866501532', 'support@Okepedia.my.id', 'Darma, Kuningan Jawa Barat', 45562, '09.00 - 18.00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_pascabayar`
--

CREATE TABLE `layanan_pascabayar` (
  `id` int(10) NOT NULL,
  `service_id` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `kategori` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Normal','Gangguan') COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(25) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `layanan_pascabayar`
--

INSERT INTO `layanan_pascabayar` (`id`, `service_id`, `provider_id`, `kategori`, `layanan`, `status`, `provider`, `tipe`, `server`) VALUES
(24, '813', '813', 'INTERNET PASCABAYAR', 'SPEEDY & INDIHOME', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(25, '812', '812', 'INTERNET PASCABAYAR', 'MyRepublic', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(26, '814', '814', 'INTERNET PASCABAYAR', 'TELKOMPSTN', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(27, '811', '811', 'INTERNET PASCABAYAR', 'CBN', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(28, '819', '819', 'PDAM', 'PDAM Kota Tangerang', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(29, '815', '815', 'PDAM', 'PDAM Kabupaten Boyolali', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(30, '816', '816', 'PDAM', 'PDAM Kabupaten Karanganyar', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(31, '817', '817', 'PDAM', 'PDAM Kabupaten Klaten', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(32, '818', '818', 'PDAM', 'PDAM Kabupaten Wonogiri', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(33, '820', '820', 'BPJS KESEHATAN', 'Bpjs Kesehatan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(34, '822', '822', 'TV PASCABAYAR', 'INDOVISION', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(35, '821', '821', 'TV PASCABAYAR', 'FIRSTMEDIA', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(36, '823', '823', 'TV PASCABAYAR', 'TELKOMVISION', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(37, '842', '842', 'MULTIFINANCE', 'Aeon Cicilan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(38, '852', '852', 'MULTIFINANCE', 'PT Aeon Credit Service Indonesia', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(39, '843', '843', 'MULTIFINANCE', 'Allianz Asuransi', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(40, '853', '853', 'MULTIFINANCE', 'PT Arthaasia Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(41, '841', '841', 'MULTIFINANCE', 'Acc (Astra Credit Company-Astra Sedaya Finance)', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(42, '845', '845', 'MULTIFINANCE', 'Bca Multifinance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(43, '854', '854', 'MULTIFINANCE', 'PT BFI Finance Indonesia INDONESIA', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(44, '846', '846', 'MULTIFINANCE', 'CIMB Niaga JCB', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(45, '847', '847', 'MULTIFINANCE', 'Clipan Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(46, '844', '844', 'MULTIFINANCE', 'Angsuran Kredit Plus(Finansia)', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(47, '848', '848', 'MULTIFINANCE', 'Home Credit Indonesia', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(48, '849', '849', 'MULTIFINANCE', 'Indomobil Finance Indonesia', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(49, '850', '850', 'MULTIFINANCE', 'MNC Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(50, '851', '851', 'MULTIFINANCE', 'OTO Kredit Mobil/Motor', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(51, '855', '855', 'MULTIFINANCE', 'Pembayaran PT. Suzuki Finance', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(52, '856', '856', 'PLN PASCABAYAR', 'Pln Pascabayar', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(53, '857', '857', 'GAS NEGARA', 'Gas Negara', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(54, '1052', '1052', 'PDAM', 'PDAM Kota Surakarta', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(55, '1026', '1026', 'PDAM', 'PDAM Aetra', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(56, '1028', '1028', 'PDAM', 'PDAM Batam', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(57, '1027', '1027', 'PDAM', 'PDAM Ats Palembang', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(58, '1029', '1029', 'PDAM', 'PDAM Batang', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(59, '1030', '1030', 'PDAM', 'PDAM Giri Menang Mataram', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(60, '1031', '1031', 'PDAM', 'PDAM Intan Banjar', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(61, '1032', '1032', 'PDAM', 'PDAM Kabupaten Balangan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(62, '1033', '1033', 'PDAM', 'PDAM Kabupaten Bandung', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(63, '1034', '1034', 'PDAM', 'PDAM Kabupaten Bandung Barat', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(64, '1035', '1035', 'PDAM', 'PDAM Kabupaten Bangkalan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(65, '1036', '1036', 'PDAM', 'PDAM Kabupaten Banyumas', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(66, '1037', '1037', 'PDAM', 'PDAM Kabupaten Banyuwangi', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(67, '1054', '1054', 'PDAM', 'PDAM kabupaten Barabai', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(68, '1038', '1038', 'PDAM', 'PDAM Kabupaten Blora', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(69, '1039', '1039', 'PDAM', 'PDAM Kabupaten Malang', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(70, '1040', '1040', 'PDAM', 'PDAM Kabupaten Mojokerto', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(71, '1041', '1041', 'PDAM', 'PDAM Kabupaten Semarang', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(72, '1042', '1042', 'PDAM', 'PDAM Kabupaten Sleman', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(73, '1043', '1043', 'PDAM', 'PDAM Kabupaten Sukabumi', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(74, '1044', '1044', 'PDAM', 'PDAM Kabupaten Tasikmalaya', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(75, '1045', '1045', 'PDAM', 'PDAM Kabupaten Temanggung', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(76, '1046', '1046', 'PDAM', 'PDAM Kabupaten Wonosobo', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(77, '1047', '1047', 'PDAM', 'PDAM Kota Balikpapan', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(78, '1048', '1048', 'PDAM', 'PDAM Kota Bandar Lampung', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(79, '1049', '1049', 'PDAM', 'PDAM Kota Bandung', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(80, '1050', '1050', 'PDAM', 'PDAM Kota Banjar', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(81, '1051', '1051', 'PDAM', 'PDAM Kota Banjarmasin', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(82, '1053', '1053', 'PDAM', 'PDAM Palyja Jakarta', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(83, '1720', '1720', 'PBB', 'PBB Provinsi Jawa Tengah', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(84, '1715', '1715', 'HP PASCABAYAR', 'Halo Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(85, '1716', '1716', 'HP PASCABAYAR', 'Matrix', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(86, '1718', '1718', 'HP PASCABAYAR', 'Three Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(87, '1719', '1719', 'HP PASCABAYAR', 'XL Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(88, '1717', '1717', 'HP PASCABAYAR', 'Smartfren Postpaid', 'Normal', 'DG-PULSA', 'Pascabayar', 'PASCABAYAR'),
(89, '', '', '', '', 'Gangguan', 'DG-PULSA', '', 'PASCABAYAR');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_pulsa`
--

CREATE TABLE `layanan_pulsa` (
  `id` int(10) NOT NULL,
  `service_id` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `operator` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` text COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi` text COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `harga_api` double NOT NULL,
  `multi` enum('Ya','Tidak') COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Normal','Gangguan') COLLATE utf8_swedish_ci NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `server` varchar(25) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `layanan_pulsa`
--

INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `multi`, `status`, `provider`, `tipe`, `server`) VALUES
(806, '1', '1', 'Pulsa TELKOMSEL', 'Telkomsel 5.000', 'Pulsa Telkomsel Rp 5.000', 5835, 5585, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(807, '2', '2', 'Pulsa TELKOMSEL', 'Telkomsel 10.000', 'Pulsa Telkomsel Rp 10.000', 10770, 10520, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(808, '3', '3', 'Pulsa TELKOMSEL', 'Telkomsel 15.000', 'Pulsa Telkomsel Rp 15.000', 15355, 15105, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(809, '4', '4', 'Pulsa TELKOMSEL', 'Telkomsel 20.000', 'Pulsa Telkomsel Rp 20.000', 20425, 20175, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(810, '5', '5', 'Pulsa TELKOMSEL', 'Telkomsel 25.000', 'Pulsa Telkomsel Rp 25.000', 25395, 25145, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(811, '6', '6', 'Pulsa TELKOMSEL', 'Telkomsel 30.000', 'Pulsa Telkomsel Rp 30.000', 30145, 29895, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(812, '8', '8', 'Pulsa TELKOMSEL', 'Telkomsel 40.000', 'Pulsa Telkomsel Rp 40.000', 39620, 39370, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(813, '9', '9', 'Pulsa TELKOMSEL', 'Telkomsel 50.000', 'Pulsa Telkomsel Rp 50.000', 50195, 49945, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(814, '10', '10', 'Pulsa TELKOMSEL', 'Telkomsel 60.000', 'Pulsa Telkomsel Rp 60.000', 60270, 60020, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(815, '11', '11', 'Pulsa TELKOMSEL', 'Telkomsel 70.000', 'Pulsa Telkomsel Rp 70.000', 70195, 69945, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(816, '12', '12', 'Pulsa TELKOMSEL', 'Telkomsel 80.000', 'Pulsa Telkomsel Rp 80.000', 80145, 79895, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(817, '13', '13', 'Pulsa TELKOMSEL', 'Telkomsel 90.000', 'Pulsa Telkomsel Rp 90.000', 90020, 89770, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(818, '14', '14', 'Pulsa TELKOMSEL', 'Telkomsel 100.000', 'Pulsa Telkomsel Rp 100.000', 97370, 97120, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(819, '15', '15', 'Pulsa TELKOMSEL', 'Telkomsel 150.000', 'Pulsa Telkomsel Rp 150.000', 148400, 148150, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(820, '16', '16', 'Pulsa TELKOMSEL', 'Telkomsel 200.000', 'Pulsa Telkomsel Rp 200.000', 197100, 196850, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(821, '17', '17', 'Pulsa TELKOMSEL', 'Telkomsel 300.000', 'Pulsa Telkomsel Rp 300.000', 292025, 291775, 'Tidak', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(822, '18', '18', 'Pulsa TELKOMSEL', 'Telkomsel 500.000', 'Pulsa Telkomsel Rp 500.000', 485500, 485250, 'Tidak', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(823, '19', '19', 'Pulsa TELKOMSEL', 'Telkomsel 1.000.000', 'Pulsa Telkomsel Rp 1.000.000', 985525, 985275, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(824, '20', '20', 'Pulsa INDOSAT', 'Indosat 5.000', 'Pulsa Indosat Rp 5.000', 6205, 5955, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(825, '21', '21', 'Pulsa INDOSAT', 'Indosat 10.000', 'Pulsa Indosat Rp 10.000', 11205, 10955, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(826, '22', '22', 'Pulsa INDOSAT', 'Indosat 15.000', 'Pulsa Indosat Rp 15.000', 15470, 15220, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(827, '23', '23', 'Pulsa INDOSAT', 'Indosat 20.000', 'Pulsa Indosat Rp 20.000', 20355, 20105, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(828, '24', '24', 'Pulsa INDOSAT', 'Indosat 25.000', 'Pulsa Indosat Rp 25.000', 25305, 25055, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(829, '25', '25', 'Pulsa INDOSAT', 'Indosat 30.000', 'Pulsa Indosat Rp 30.000', 30270, 30020, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(830, '26', '26', 'Pulsa INDOSAT', 'Indosat 40.000', 'Pulsa Indosat Rp 40.000', 39775, 39525, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(831, '27', '27', 'Pulsa INDOSAT', 'Indosat 50.000', 'Pulsa Indosat Rp 50.000', 49325, 49075, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(832, '28', '28', 'Pulsa INDOSAT', 'Indosat 60.000', 'Pulsa Indosat Rp 60.000', 59075, 58825, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(833, '29', '29', 'Pulsa INDOSAT', 'Indosat 80.000', 'Pulsa Indosat Rp 80.000', 78175, 77925, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(834, '30', '30', 'Pulsa INDOSAT', 'Indosat 90.000', 'Pulsa Indosat Rp 90.000', 87475, 87225, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(835, '31', '31', 'Pulsa INDOSAT', 'Indosat 100.000', 'Pulsa Indosat Rp 100.000', 97070, 96820, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(836, '32', '32', 'Pulsa INDOSAT', 'Indosat 150.000', 'Pulsa Indosat Rp 150.000', 144998, 144748, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(837, '33', '33', 'Pulsa INDOSAT', 'Indosat 200.000', 'Pulsa Indosat Rp 200.000', 188717, 188467, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(838, '34', '34', 'Pulsa INDOSAT', 'Indosat 250.000', 'Pulsa Indosat Rp 250.000', 241230, 240980, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(839, '35', '35', 'Pulsa INDOSAT', 'Indosat 500.000', 'Pulsa Indosat Rp 500.000', 482688, 482438, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(840, '36', '36', 'Pulsa INDOSAT', 'Indosat 1.000.000', 'Pulsa Indosat Rp 1.000.000', 963846, 963596, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(841, '37', '37', 'Pulsa AXIS', 'Axis 5.000', 'Pulsa Axis Rp 5.000', 6280, 6030, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(842, '38', '38', 'Pulsa AXIS', 'Axis 10.000', 'Pulsa Axis Rp 10.000', 11200, 10950, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(843, '39', '39', 'Pulsa AXIS', 'Axis 15.000', 'Pulsa Axis Rp 15.000', 15320, 15070, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(844, '40', '40', 'Pulsa AXIS', 'Axis 25.000', 'Pulsa Axis Rp 25.000', 25175, 24925, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(845, '41', '41', 'Pulsa AXIS', 'Axis 30.000', 'Pulsa Axis Rp 30.000', 30095, 29845, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(846, '42', '42', 'Pulsa AXIS', 'Axis 50.000', 'Pulsa Axis Rp 50.000', 49775, 49525, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(847, '43', '43', 'Pulsa AXIS', 'Axis 100.000', 'Pulsa Axis Rp 100.000', 98850, 98600, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(848, '44', '44', 'Pulsa AXIS', 'Axis 200.000', 'Pulsa Axis Rp 200.000', 199425, 199175, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(849, '45', '45', 'Pulsa AXIS', 'Axis 300.000', 'Pulsa Axis Rp 300.000', 299825, 299575, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(850, '46', '46', 'Pulsa AXIS', 'Axis 500.000', 'Pulsa Axis Rp 500.000', 499025, 498775, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(851, '47', '47', 'Pulsa AXIS', 'Axis 1.000.000', 'Pulsa Axis Rp 1.000.000', 995025, 994775, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(852, '48', '48', 'Pulsa SMART', 'Smart 5.000', 'Pulsa Smart Rp 5.000', 5475, 5225, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(853, '49', '49', 'Pulsa SMART', 'Smart 10.000', 'Pulsa Smart Rp 10.000', 10455, 10205, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(854, '50', '50', 'Pulsa SMART', 'Smart 15.000', 'Pulsa Smart Rp 15.000', 15360, 15110, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(855, '51', '51', 'Pulsa SMART', 'Smart 20.000', 'Pulsa Smart Rp 20.000', 20330, 20080, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(856, '52', '52', 'Pulsa SMART', 'Smart 25.000', 'Pulsa Smart Rp 25.000', 24910, 24660, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(857, '53', '53', 'Pulsa SMART', 'Smart 50.000', 'Pulsa Smart Rp 50.000', 49025, 48775, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(858, '54', '54', 'Pulsa SMART', 'Smart 60.000', 'Pulsa Smart Rp 60.000', 58970, 58720, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(859, '56', '56', 'Pulsa SMART', 'Smart 100.000', 'Pulsa Smart Rp 100.000', 96725, 96475, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(860, '55', '55', 'Pulsa SMART', 'Smart 75.000', 'Pulsa Smart 75.000', 74200, 73950, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(861, '57', '57', 'Pulsa SMART', 'Smart 150.000', 'Pulsa Smart Rp 150.000', 149125, 148875, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(862, '58', '58', 'Pulsa SMART', 'Smart 200.000', 'Pulsa Smart Rp 200.000', 198675, 198425, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(863, '59', '59', 'Pulsa SMART', 'Smart 300.000', 'Pulsa Smart Rp 300.000', 297725, 297475, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(864, '60', '60', 'Pulsa SMART', 'Smart 500.000', 'Pulsa Smart Rp 500.000', 495850, 495600, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(865, '61', '61', 'Pulsa TRI', 'Three 5.000', 'Pulsa Three Rp 5.000', 5758, 5508, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(866, '62', '62', 'Pulsa TRI', 'Three 10.000', 'Pulsa Three Rp 10.000', 10618, 10368, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(867, '63', '63', 'Pulsa TRI', 'Three 15.000', 'Pulsa Three Rp 15.000', 15079, 14829, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(868, '64', '64', 'Pulsa TRI', 'Three 20.000', 'Pulsa Three Rp 20.000', 19920, 19670, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(869, '65', '65', 'Pulsa TRI', 'Three 25.000', 'Pulsa Three Rp 25.000', 24765, 24515, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(870, '66', '66', 'Pulsa TRI', 'Three 30.000', 'Pulsa Three Rp 30.000', 29610, 29360, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(871, '67', '67', 'Pulsa TRI', 'Three 40.000', 'Pulsa Three Rp 40.000', 39300, 39050, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(872, '68', '68', 'Pulsa TRI', 'Three 50.000', 'Pulsa Three Rp 50.000', 49020, 48770, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(873, '70', '70', 'Pulsa TRI', 'Three 100.000', 'Pulsa Three Rp 100.000', 97465, 97215, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(874, '71', '71', 'Pulsa TRI', 'Three 150.000', 'Pulsa Three Rp 150.000', 148500, 148250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(875, '72', '72', 'Pulsa TRI', 'Three 200.000', 'Pulsa Three Rp 200.000', 194730, 194480, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(876, '73', '73', 'Pulsa TRI', 'Three 500.000', 'Pulsa Three Rp 500.000', 496500, 496250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(877, '74', '74', 'Pulsa XL', 'Xl 5.000', 'Pulsa Xl Rp 5.000', 6295, 6045, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(878, '75', '75', 'Pulsa XL', 'Xl 10.000', 'Pulsa Xl Rp 10.000', 11215, 10965, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(879, '76', '76', 'Pulsa XL', 'Xl 15.000', 'Pulsa Xl Rp 15.000', 15335, 15085, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(880, '77', '77', 'Pulsa XL', 'Xl 25.000', 'Pulsa Xl Rp 25.000', 25155, 24905, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(881, '78', '78', 'Pulsa XL', 'XL 30.000', 'Pulsa Xl Rp 30.000', 30150, 29900, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(882, '79', '79', 'Pulsa XL', 'Xl 50.000', 'Pulsa Xl Rp 50.000', 49725, 49475, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(883, '80', '80', 'Pulsa XL', 'Xl 100.000', 'Pulsa Xl Rp 100.000', 98670, 98420, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(884, '81', '81', 'Pulsa XL', 'Xl 150.000', 'Pulsa Xl Rp 150.000', 148750, 148500, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(885, '82', '82', 'Pulsa XL', 'Xl 200.000', 'Pulsa Xl Rp 200.000', 197850, 197600, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(886, '83', '83', 'Pulsa XL', 'Xl 500.000', 'Pulsa Xl Rp 500.000', 495500, 495250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(887, '84', '84', 'Data SMART', 'Smartfren Unlimited Booster 10.000', 'Batas pemakaian wajar 500MB/hari, Unlimited 24 Jam, Berlaku 7 hari', 10350, 10100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(888, '85', '85', 'Data SMART', 'Smartfren Kuota Nonstop 30.000', '6 GB 24 jam Nonstop, Kecepatan setelah kuota habis 256Kbps aktif selama 28 hari', 28300, 28050, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(889, '86', '86', 'Data SMART', 'Smartfren Kuota Nonstop 45.000', '10 GB 24 jam Nonstop, Tambahan 4 GB (1 GB setiap minggu), Kecepatan setelah kuota habis 256Kbps aktif selama 28 hari', 42600, 42350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(890, '87', '87', 'Data SMART', 'Smartfren Kuota Nonstop 65.000', '18 GB 24 jam Nonstop, Tambahan 8 GB (2 GB setiap minggu), Kecepatan setelah kuota habis 256Kbps aktif selama 28 hari', 60610, 60360, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(891, '88', '88', 'Data SMART', 'Smartfren Kuota Nonstop 100.000', '30 GB 24 jam Nonstop, Tambahan 8 GB (2 GB setiap minggu), Kecepatan setelah kuota habis 256Kbps aktif selama 28 hari', 94685, 94435, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(892, '89', '89', 'Data SMART', 'Smartfren Unlimited 20.000', 'Batas pemakaian wajar 1GB/hari, Unlimited 24 Jam, Gratis Nelpon ke sesama smartfren, Berlaku 7 hari', 19485, 19235, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(893, '90', '90', 'Data SMART', 'Smartfren Unlimited 40.000', 'Batas pemakaian wajar 1GB/hari, Unlimited 24 Jam, Gratis Nelpon ke sesama smartfren, Berlaku 14 hari', 38035, 37785, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(894, '91', '91', 'Data SMART', 'Smartfren Unlimited 55.000', 'Batas pemakaian wajar 500MB/hari, Unlimited 24 Jam, Gratis Nelpon ke sesama smartfren, Berlaku 28 hari', 58025, 57775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(895, '92', '92', 'Data SMART', 'Smartfren Unlimited 80.000', 'Batas pemakaian wajar 1GB/hari, Unlimited 24 Jam, Gratis Nelpon ke sesama smartfren, Berlaku 28 hari', 76650, 76400, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(896, '95', '95', 'Games MOBILE LEGEND', 'MOBILELEGEND - 5 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 2100, 1850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(897, '102', '102', 'Games MOBILE LEGEND', 'MOBILELEGEND - 33 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 10410, 10160, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(898, '103', '103', 'Games MOBILE LEGEND', 'MOBILELEGEND - 36 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 10499, 10249, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(899, '104', '104', 'Games MOBILE LEGEND', 'MOBILELEGEND - 44 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 12550, 12300, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(900, '105', '105', 'Games MOBILE LEGEND', 'MOBILELEGEND - 45 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 14500, 14250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(901, '107', '107', 'Games MOBILE LEGEND', 'MOBILELEGEND - 59 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 16500, 16250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(902, '108', '108', 'Games MOBILE LEGEND', 'MOBILELEGEND - 60 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 17500, 17250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(903, '109', '109', 'Games MOBILE LEGEND', 'MOBILELEGEND - 67 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 19500, 19250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(904, '110', '110', 'Games MOBILE LEGEND', 'MOBILELEGEND - 75 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 19610, 19360, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(905, '111', '111', 'Games MOBILE LEGEND', 'MOBILELEGEND - 85 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 19410, 19160, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(906, '112', '112', 'Games MOBILE LEGEND', 'MOBILELEGEND - 86 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 19410, 19160, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(907, '113', '113', 'Games MOBILE LEGEND', 'MOBILELEGEND - 170 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 39025, 38775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(908, '114', '114', 'Games MOBILE LEGEND', 'MOBILELEGEND - 193 Diamond + Starlight Member', 'MOBILELEGEND - 193 Diamond + Starlight Member', 201700, 201450, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(909, '121', '121', 'Games MOBILE LEGEND', 'MOBILELEGEND - 240 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 59025, 58775, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(910, '122', '122', 'Games MOBILE LEGEND', 'MOBILELEGEND - 257 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 58025, 57775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(911, '123', '123', 'Games MOBILE LEGEND', 'MOBILELEGEND - 296 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 77500, 77250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(912, '124', '124', 'Games MOBILE LEGEND', 'MOBILELEGEND - 344 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 78275, 78025, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(913, '125', '125', 'Games MOBILE LEGEND', 'MOBILELEGEND - 429 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 97275, 97025, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(914, '126', '126', 'Games MOBILE LEGEND', 'MOBILELEGEND - 514 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 116825, 116575, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(915, '127', '127', 'Games MOBILE LEGEND', 'MOBILELEGEND - 568 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 140525, 140275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(916, '128', '128', 'Games MOBILE LEGEND', 'MOBILELEGEND - 586 Diamond + Starlight Member', 'MOBILELEGEND - 586 Diamond + Starlight Member', 286575, 286325, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(917, '129', '129', 'Games MOBILE LEGEND', 'MOBILELEGEND - 702 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 152525, 152275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(918, '130', '130', 'Games MOBILE LEGEND', 'MOBILELEGEND - 706 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 152525, 152275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(919, '131', '131', 'Games MOBILE LEGEND', 'MOBILELEGEND - 708 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 157000, 156750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(920, '132', '132', 'Games MOBILE LEGEND', 'MOBILELEGEND - 875 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 200525, 200275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(921, '133', '133', 'Games MOBILE LEGEND', 'MOBILELEGEND - 878 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 196025, 195775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(922, '134', '134', 'Games MOBILE LEGEND', 'MOBILELEGEND - 966 Diamond', '-', 250500, 250250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(923, '135', '135', 'Games MOBILE LEGEND', 'MOBILELEGEND - 1159 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 280525, 280275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(924, '136', '136', 'Games MOBILE LEGEND', 'MOBILELEGEND - 1411 Diamond + Starlight Member', 'MOBILELEGEND - 1411 Diamond + Starlight Member', 523600, 523350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(925, '137', '137', 'Games MOBILE LEGEND', 'MOBILELEGEND - 1412 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 310275, 310025, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(926, '138', '138', 'Games MOBILE LEGEND', 'MOBILELEGEND - 1446 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 320525, 320275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(927, '139', '139', 'Games MOBILE LEGEND', 'MOBILELEGEND - 1830 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 400525, 400275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(928, '140', '140', 'Games MOBILE LEGEND', 'MOBILELEGEND - 2010 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 450525, 450275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(929, '141', '141', 'Games MOBILE LEGEND', 'MOBILELEGEND - 2195 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 470500, 470250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(930, '143', '143', 'Games MOBILE LEGEND', 'MOBILELEGEND - 4026 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 870525, 870275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(931, '144', '144', 'Games MOBILE LEGEND', 'MOBILELEGEND - 4830 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 1095525, 1095275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(932, '145', '145', 'Games MOBILE LEGEND', 'MOBILELEGEND - 5408 Diamond + Starlight Member', 'MOBILELEGEND - 5408 Diamond + Starlight Member', 1427320, 1427070, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(933, '146', '146', 'Games MOBILE LEGEND', 'MOBILELEGEND - 5532 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 1200525, 1200275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(934, '147', '147', 'Games MOBILE LEGEND', 'MOBILELEGEND - 6050 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 1400525, 1400275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(935, '148', '148', 'Games MOBILE LEGEND', 'MOBILELEGEND - 7502 Diamond', 'no pelanggan = gabungan antara user_id dan zone_id', 1650525, 1650275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(936, '115', '115', 'PLN PLN', 'PLN 20.000', 'masukkan nomor meter/id pelanggan', 20518, 20268, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(937, '116', '116', 'PLN PLN', 'PLN 50.000', 'masukkan nomor meter/id pelanggan', 50533, 50283, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(938, '117', '117', 'PLN PLN', 'PLN 100.000', 'masukkan nomor meter/id pelanggan', 100533, 100283, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(939, '118', '118', 'PLN PLN', 'PLN 200.000', 'masukkan nomor meter/id pelanggan', 200533, 200283, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(940, '119', '119', 'PLN PLN', 'PLN 500.000', 'masukkan nomor meter/id pelanggan', 500533, 500283, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(941, '120', '120', 'PLN PLN', 'PLN 1.000.000', 'masukkan nomor meter/id pelanggan', 1000533, 1000283, 'Ya', 'Normal', 'DG-PULSA', 'PLN', 'TOP UP'),
(942, '93', '93', 'Data INDOSAT', 'Indosat Internet Unlimited + 36GB, 12 bulan', 'Kuota Utama 3GB/bulan(3G/4G) 24 Jam + Unlimited Aplikasi sehari-hari + Unlimited Streaming Youtube, Spotify, dan iFlix + Unlimited SMS ke IM3 Ooredoo Masa Aktif 12 bulan', 441518, 441268, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(943, '94', '94', 'Data INDOSAT', 'Indosat Unlimited JUMBO / 30 Hari', 'Kuota Utama JUMBO + Unlimited Aplikasi sehari-hari + Unlimited Streaming Spotify dan iFlix + 100 SMS ke Semua Operator + Unlimited Nelpon + SMS ke Indosat + Unlimited Youtube', 139500, 139250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(944, '149', '149', 'Voucher WIFI ID', 'Akses wifi.id 1 hari', '6 Jam untuk Sumatera, Jawa, Balinusa. 4 jam untuk Kalimantan dan Sulawesi. 2 Jam untuk Maluku dan Papua. NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 4300, 4050, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(945, '150', '150', 'Voucher WIFI ID', 'Akses wifi.id 7 hari', 'NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 16010, 15760, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(946, '151', '151', 'Voucher WIFI ID', 'Akses wifi.id 30 hari', 'NB : Pelanggan akan terima notif sms berupa USER dan PASS dari Telkom', 37025, 36775, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(947, '152', '152', 'Data TELKOMSEL', 'Telkomsel Data 30 GB / 7 Hari', '-', 83625, 83375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(948, '153', '153', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 5 GB Videomax / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 23809, 23559, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(949, '154', '154', 'Data TELKOMSEL', 'Telkomsel Data 3 GB + 12 GB Videomax / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 47825, 47575, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(950, '155', '155', 'Data TELKOMSEL', 'Telkomsel Data 7 GB + 28 GB Videomax / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 95825, 95575, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(951, '156', '156', 'Data TELKOMSEL', 'Telkomsel Data 15 GB + 40 GB Videomax / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 144825, 144575, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(952, '157', '157', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 5 GB Ruang Guru / 30 Hari', 'masa aktif 30 hr', 28499, 28249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(953, '158', '158', 'Data TELKOMSEL', 'Telkomsel Data 2 GB + 10 GB Ruang Guru / 30 Hari', 'masa aktif 30 hr', 43499, 43249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(954, '159', '159', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 10 GB Ilmu Pedia / 30 Hari', 'masa aktif 30 hr', 28499, 28249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(955, '160', '160', 'Data TELKOMSEL', 'Telkomsel Data 2 GB + 20 GB Ilmu Pedia / 30 Hari', 'masa aktif 30 hr', 43499, 43249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(956, '161', '161', 'Data TELKOMSEL', 'Telkomsel Data 500 MB / 1 Hari', '-', 5625, 5375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(957, '162', '162', 'Data TELKOMSEL', 'Telkomsel Data 5 GB / 1 Hari', '-', 18625, 18375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(958, '163', '163', 'Data TELKOMSEL', 'Telkomsel Data 500 MB / 3 Hari', '-', 15875, 15625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(959, '164', '164', 'Data TELKOMSEL', 'Telkomsel Data 20 GB / 3 Hari', '-', 58975, 58725, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(960, '165', '165', 'Data TELKOMSEL', 'Telkomsel Data 500 MB / 7 Hari', '-', 25375, 25125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(961, '166', '166', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 1 GB CHAT / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 20525, 20275, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(962, '167', '167', 'Data TELKOMSEL', 'Telkomsel Data 2 GB + 1.5 GB Youtube / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 40525, 40275, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(963, '168', '168', 'Data TELKOMSEL', 'Telkomsel Data 4 GB + 2 GB Youtube / 30 Hari', 'Berlaku nasional, masa aktif 30 Hari', 76499, 76249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(964, '169', '169', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 500 MB Youtube / 30 Hari', 'Telkomsel Data 1GB + 500MB Youtube 30 Hari', 24699, 24449, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(965, '170', '170', 'Data TELKOMSEL', 'Telkomsel Data 1 GB + 2 GB Game / 30 Hari', 'Flash 1GB + 2GB Game (30 hari)', 23450, 23200, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(966, '172', '172', 'Data TELKOMSEL', 'Telkomsel Data Flash 5.000', '20MB - 40MB sesuai zona / 7 Hari (sesuai zona)', 4875, 4625, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(967, '173', '173', 'Data TELKOMSEL', 'Telkomsel Data Flash 10.000', '50MB - 110MB sesuai zona, 7 Hari (sesuai zona)', 9275, 9025, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(968, '174', '174', 'Data TELKOMSEL', 'Telkomsel Data Flash 20.000', 'Telkomsel 200MB - 420MB sesuai zona / 7 Hari (sesuai zona)', 12775, 12525, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(969, '175', '175', 'Data TELKOMSEL', 'Telkomsel Data Flash 25.000', '360MB - 800MB sesuai zona / 30 Hari (sesuai zona)', 24000, 23750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(970, '176', '176', 'Data TELKOMSEL', 'Telkomsel Data Flash 30.000', '2.5 GB, 7 Hari (sesuai zona)', 34725, 34475, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(971, '177', '177', 'Data TELKOMSEL', 'Telkomsel Data Flash 50.000', '800MB - 1.5GB sesuai zona / 30 Hari (sesuai zona)', 41000, 40750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(972, '178', '178', 'Data TELKOMSEL', 'Telkomsel Data Flash 68.000', '4.5 GB, 24Jam 30Hari (sesuai zona)', 68575, 68325, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(973, '179', '179', 'Data TELKOMSEL', 'Telkomsel Data Flash 75.000', '6 GB + 2 GB OMG, 30 Hari (sesuai zona)', 78775, 78525, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(974, '180', '180', 'Data TELKOMSEL', 'Telkomsel Data Flash 85.000', '8 GB, 24Jam 30Hari (sesuai zona)', 88725, 88475, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(975, '181', '181', 'Data TELKOMSEL', 'Telkomsel Data Flash 100.000', '12 GB / 30 Hari (sesuai zona)', 97075, 96825, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(976, '182', '182', 'Data TELKOMSEL', 'Telkomsel Data Flash 150.000', '22 GB + 2 GB OMG, 30 Hari (sesuai zona)', 153400, 153150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(977, '183', '183', 'Data TELKOMSEL', 'Telkomsel Data Flash 200.000', '50 GB / 30 Hari (sesuai zona)', 196425, 196175, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(978, '184', '184', 'Data TELKOMSEL', 'Telkomsel Data Flash 5 MB / 1 Hari', 'Telkomsel Data Flash 5 MB / 1 Hari', 1250, 1000, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(979, '185', '185', 'Data TELKOMSEL', 'Telkomsel Data Flash 10 MB / 1 Hari', 'Telkomsel Data Flash 10 MB / 1 Hari', 1450, 1200, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(980, '186', '186', 'Data TELKOMSEL', 'Telkomsel Data Flash 20 MB / 1 Hari', 'Telkomsel Data Flash 20 MB / 1 Hari', 1950, 1700, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(981, '187', '187', 'Data TELKOMSEL', 'Telkomsel Data Flash 50 MB / 7 Hari', '24 jam 7 hari', 1825, 1575, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(982, '188', '188', 'Data TELKOMSEL', 'Telkomsel Data Flash 100 MB / 7 Hari', '24 jam 7 hari', 2050, 1800, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(983, '189', '189', 'Data TELKOMSEL', 'Telkomsel Data Flash 110 MB / 7 Hari', 'Telkomsel Data Flash 110 MB / 7 Hari', 4350, 4100, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(984, '190', '190', 'Data TELKOMSEL', 'Telkomsel Data Flash 250 MB / 7 Hari', '24 jam 7 hari', 4500, 4250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(985, '191', '191', 'Data TELKOMSEL', 'Telkomsel Data Flash 50 MB / 30 Hari', '24 jam', 3305, 3055, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(986, '192', '192', 'Data TELKOMSEL', 'Telkomsel Data Flash 100 MB / 30 Hari', '24 jam', 2045, 1795, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(987, '193', '193', 'Data TELKOMSEL', 'Telkomsel Data Flash 250 MB / 30 Hari', '24 jam', 3725, 3475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(988, '194', '194', 'Data TELKOMSEL', 'Telkomsel Data Flash 420 MB / 30 Hari', 'Telkomsel Data Flash 420 MB / 30 Hari', 11025, 10775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(989, '195', '195', 'Data TELKOMSEL', 'Telkomsel Data Flash 500 MB / 30 Hari', '24 jam 30 hari', 6725, 6475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(990, '196', '196', 'Data TELKOMSEL', 'Telkomsel Data Flash 750 MB / 30 Hari', '24 jam 30 hari', 11400, 11150, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(991, '197', '197', 'Data TELKOMSEL', 'Telkomsel Data Flash 1 GB / 30 Hari', '24Jam 30Hari', 12700, 12450, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(992, '198', '198', 'Data TELKOMSEL', 'Telkomsel Data Flash 2 GB / 30 Hari', '24Jam 30Hari', 24475, 24225, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(993, '199', '199', 'Data TELKOMSEL', 'Telkomsel Data Flash 3 GB / 30 Hari', '24Jam 30Hari', 37200, 36950, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(994, '200', '200', 'Data TELKOMSEL', 'Telkomsel Data Flash 4 GB / 30 Hari', '24Jam 30Hari', 49325, 49075, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(995, '201', '201', 'Data TELKOMSEL', 'Telkomsel Data Flash 5 GB / 30 Hari', '24jam 30hari', 63525, 63275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(996, '202', '202', 'Data TELKOMSEL', 'Telkomsel Data Flash 6 GB / 30 Hari', '24 Jam 30 Hari', 74895, 74645, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(997, '203', '203', 'Data TELKOMSEL', 'Telkomsel Data Flash 7 GB / 30 Hari', '24 jam 30 hari', 88000, 87750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(998, '204', '204', 'Data TELKOMSEL', 'Telkomsel Data Flash 8 GB / 30 Hari', '24 jam 30 Hari', 85070, 84820, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(999, '205', '205', 'Data TELKOMSEL', 'Telkomsel Data Flash 9 GB / 30 Hari', '24 jam 30 hari', 109055, 108805, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1000, '206', '206', 'Data TELKOMSEL', 'Telkomsel Data Flash 10 GB / 30 Hari', '24 jam 30 hari', 125500, 125250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1001, '207', '207', 'Data TELKOMSEL', 'Telkomsel Data Flash 11 GB / 30 Hari', 'Telkomsel Data Flash 11 GB / 30 Hari', 111725, 111475, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1002, '208', '208', 'Data TELKOMSEL', 'Telkomsel Data Flash 12 GB / 30 Hari', '24 jam 30 hari', 100500, 100250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1003, '209', '209', 'Data TELKOMSEL', 'Telkomsel Data Flash 14 GB / 30 Hari', '24 jam 30 hari', 175500, 175250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1004, '210', '210', 'Data TELKOMSEL', 'Telkomsel Data Flash 15 GB / 30 Hari', '24 jam 30 hari', 130500, 130250, 'Tidak', 'Gangguan', 'DG-PULSA', 'Data', 'TOP UP'),
(1005, '211', '211', 'Data TELKOMSEL', 'Telkomsel Data Flash 16 GB / 30 Hari', 'Telkomsel Data Flash 16 GB / 30 Hari', 155800, 155550, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1006, '212', '212', 'Data TELKOMSEL', 'Telkomsel Data Flash 25 GB / 30 Hari', '24 jam 30 hari', 313000, 312750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1007, '213', '213', 'Data TELKOMSEL', 'Telkomsel Data Flash 30 GB / 30 Hari', 'Telkomsel Data Flash 30 GB / 30 Hari', 238000, 237750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1008, '214', '214', 'Data TELKOMSEL', 'Telkomsel Data Flash 35 GB / 30 Hari', 'Telkomsel Data Flash 35 GB / 30 Hari', 263200, 262950, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1009, '215', '215', 'Data TELKOMSEL', 'Telkomsel Data Flash 45 GB / 30 Hari', '24 jam 30 hari', 563000, 562750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1010, '216', '216', 'Data TELKOMSEL', 'Telkomsel Data Flash 50 GB / 30 Hari', 'Telkomsel Data Flash 50 GB / 30 Hari', 199000, 198750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1011, '217', '217', 'Data TELKOMSEL', 'Telkomsel Data OMG 25.000', 'Data 300 MB - 750MB + 1GB OMG berlaku 30 hari, kuota yang didapat sesuai zona, cek di *363*46#', 25500, 25250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1012, '218', '218', 'Data TELKOMSEL', 'Telkomsel Data OMG 30.000', '3 GB + 1 GB OMG, kuota yang didapat sesuai zona, cek di *363*46#', 30400, 30150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1013, '219', '219', 'Data TELKOMSEL', 'Telkomsel Data OMG 50.000', 'Inet+OMG Zona RP50RB (2.5GB+1GB - 5.5GB+1GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 50525, 50275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1014, '220', '220', 'Data TELKOMSEL', 'Telkomsel Data OMG 75.000', 'Inet+OMG Zona RP75RB (3.5GB+2GB - 8.5GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 75025, 74775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1015, '221', '221', 'Data TELKOMSEL', 'Telkomsel Data OMG 100.000', 'Inet+OMG Zona RP100RB (9.5GB+2GB - 18GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 99025, 98775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1016, '222', '222', 'Data TELKOMSEL', 'Telkomsel Data OMG 150.000', 'Inet+OMG Zona RP150RB (17.5GB+2GB - 32GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 149525, 149275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1017, '223', '223', 'Data TELKOMSEL', 'Telkomsel Data OMG 200.000', 'Inet+OMG Zona RP200RB (39GB+2GB - 63GB+2GB OMG 30HR), kuota yang didapat sesuai zona, cek di *363*46#', 197025, 196775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1018, '224', '224', 'Data INDOSAT', 'Indosat 100 MB / 30 Hari', 'Indosat 100MB 30 Hari', 1700, 1450, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1019, '225', '225', 'Data INDOSAT', 'Indosat 200 MB / 30 Hari', 'Indosat 200MB 30 Hari', 2275, 2025, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1020, '226', '226', 'Data INDOSAT', 'Indosat 300 MB / 30 Hari', 'Indosat 300MB 30 Hari', 3175, 2925, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1021, '227', '227', 'Data INDOSAT', 'Indosat 500 MB / 30 Hari', 'Indosat 500MB 30 Hari', 4875, 4625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1022, '228', '228', 'Data INDOSAT', 'Indosat 750 MB / 30 Hari', 'Indosat 750MB 30 Hari', 6500, 6250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1023, '229', '229', 'Data INDOSAT', 'Indosat 1 GB / 30 Hari', 'KUOTA 1GB 30 hari', 8100, 7850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1024, '231', '231', 'Data INDOSAT', 'Indosat 3 GB / 30 Hari', 'KUOTA 3GB 30 hari', 25475, 25225, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1025, '232', '232', 'Data INDOSAT', 'Indosat 5 GB / 30 Hari', 'KUOTA 5GB 30 hari', 41870, 41620, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1026, '230', '230', 'Data INDOSAT', 'Indosat 2 GB / 30 Hari', 'KUOTA 2GB 30 hari', 15025, 14775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1027, '233', '233', 'Data INDOSAT', 'Indosat 4 GB / 30 Hari', 'kuota 4GB 30 hari', 25350, 25100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1028, '234', '234', 'Data INDOSAT', 'Indosat 6 GB / 30 Hari', 'Kuota 6GB 30 hari', 48870, 48620, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1029, '235', '235', 'Data INDOSAT', 'Indosat 7 GB / 30 Hari', 'Kuota 7GB 30 hari', 49525, 49275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1030, '236', '236', 'Data INDOSAT', 'Indosat 8 GB / 30 Hari', 'Kuota 8GB 30 hari', 61920, 61670, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1031, '237', '237', 'Data INDOSAT', 'Indosat 9 GB / 30 Hari', 'Kuota 9GB 30 hari', 65570, 65320, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1032, '238', '238', 'Data INDOSAT', 'Indosat 10 GB / 30 Hari', 'Kuota 10GB 30 hari', 70500, 70250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1033, '247', '247', 'Data INDOSAT', 'Indosat Yellow 1 GB / 1 Hari', '-', 3150, 2900, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1034, '248', '248', 'Data INDOSAT', 'Indosat Yellow 1 GB / 3 Hari', '-', 5480, 5230, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1035, '249', '249', 'Data INDOSAT', 'Indosat Yellow 1 GB / 7 Hari', '-', 10100, 9850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1036, '250', '250', 'Data INDOSAT', 'Indosat Yellow 1 GB / 15 Hari', '-', 13450, 13200, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1037, '252', '252', 'Data INDOSAT', 'Indosat Freedom Combo 8 GB / 30 Hari', '8GB (4GB + 2GB Lokal, 2 GB Malam, Telepon 20 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 32175, 31925, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1038, '254', '254', 'Data INDOSAT', 'Indosat Freedom Combo 14 GB / 30 Hari', '14GB (7.5GB + 3.5GB Lokal, 3GB Mlm, Telepon 30 Mnt ALL 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 46595, 46345, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1039, '255', '255', 'Data INDOSAT', 'Indosat Freedom Combo 20 GB / 30 Hari', '20GB (11GB + 5GB Lokal, 4GB Mlm,Telepon 40 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 64350, 64100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1040, '256', '256', 'Data INDOSAT', 'Indosat Freedom Combo 30 GB / 30 Hari', '30GB (16GB + 8GB Lokal, 6 GB Mlm, Telepon 60 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 90500, 90250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1041, '257', '257', 'Data INDOSAT', 'Indosat Freedom Combo 50 GB / 30 Hari', '50GB (25GB + 15GB Lokal, 10GB Mlm, Telepon 60 Mnt All 30hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 135500, 135250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1042, '258', '258', 'Data INDOSAT', 'Indosat Freedom Combo 50 GB / 90 Hari', '50GB (25GB + 15GB Lokal, 10GB Mlm, Telepon 60 Mnt All 90hr) Paket hanya berlaku di area Jakarta, Botabek, West Java, Central Java, East Java, Kalimantan.', 155525, 155275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1043, '259', '259', 'Data INDOSAT', 'Indosat Freedom Kuota Harian 7 GB / 7 Hari', 'Total Kuota 7GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 7 hari', 19000, 18750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1044, '260', '260', 'Data INDOSAT', 'Indosat Freedom Kuota Harian 14 GB / 14 Hari', 'Total Kuota 14GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 14 hari', 37145, 36895, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1045, '261', '261', 'Data INDOSAT', 'Indosat Freedom Kuota Harian 28 GB / 28 Hari', 'Total Kuota 28GB dengan batas pemakaian harian 1GB/hari. Setelah batas pemakaian harian, pemakaian internet gratis dgn Pulsa Safe kecepatan s.d 64Kbps. Masa aktif 28 hari', 69345, 69095, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1046, '262', '262', 'Data INDOSAT', 'Indosat Data Mini 2.5 GB / 30 Hari', '1 GB kuota utama + 1 GB kuota malam (01.00 - 06.00) + 0.5 GB kuota apps, berlaku 30 Hari', 20575, 20325, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1047, '263', '263', 'Data INDOSAT', 'Indosat Freedom 1.5 GB / 5 Hari', 'INDOSAT DATA FREEDOM 1.5 GB FULL 24 JAM NASIONAL, 5 Hari', 8500, 8250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1048, '264', '264', 'Data INDOSAT', 'Indosat Freedom 2 GB / 15 Hari', 'INDOSAT DATA FREEDOM 2GB FULL 24 JAM NASIONAL, 15HARI', 14250, 14000, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1049, '265', '265', 'Data INDOSAT', 'Indosat Freedom 2 GB / 30 Hari', 'INDOSAT DATA FREEDOM 2GB FULL 24 JAM NASIONAL, 30HARI', 15035, 14785, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1050, '266', '266', 'Data INDOSAT', 'Indosat Freedom 3 GB / 30 Hari', 'INDOSAT DATA FREEDOM 3GB FULL 24 JAM NASIONAL, 30HARI', 24400, 24150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1051, '268', '268', 'Data INDOSAT', 'Indosat Freedom 4 GB / 30 Hari', '24 Jam, Nasional', 25250, 25000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1052, '269', '269', 'Data INDOSAT', 'Indosat Freedom 8 GB / 30 Hari', 'INDOSAT DATA FREEDOM 8 GB FULL 24 JAM NASIONAL, 30 HARI', 35800, 35550, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1053, '270', '270', 'Data INDOSAT', 'Indosat Freedom 10 GB / 30 Hari', 'INDOSAT DATA FREEDOM 10GB FULL 24 JAM NASIONAL, 30HARI', 34500, 34250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1054, '271', '271', 'Data INDOSAT', 'Indosat Freedom 18 GB / 30 Hari', 'INDOSAT DATA FREEDOM 18GB FULL 24 JAM NASIONAL, 30HARI', 50500, 50250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1055, '272', '272', 'Data INDOSAT', 'Indosat Freedom 21 GB / 30 Hari', '24 Jam, Nasional', 60525, 60275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1056, '273', '273', 'Data INDOSAT', 'Indosat Freedom 25 GB / 30 Hari', 'INDOSAT DATA FREEDOM 25GB FULL 24 JAM NASIONAL, 30HARI', 67500, 67250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1057, '274', '274', 'Data INDOSAT', 'Indosat Freedom 30 GB / 30 Hari', '24 Jam, Nasional', 80525, 80275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1058, '275', '275', 'Data INDOSAT', 'Indosat Freedom 50 GB / 30 Hari', 'Indosat Freedom 50 GB / 30 Hari', 96500, 96250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1059, '276', '276', 'Data INDOSAT', 'Indosat Freedom 60 GB / 30 Hari', 'Indosat Freedom 60 GB / 30 Hari', 128000, 127750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1060, '277', '277', 'Data INDOSAT', 'Indosat Freedom M', 'Kuota Dasar 2GB (2G/3G/4G) + Bonus 3GB (4G) + 5GB Kuota malam + 2GB stream on, Kuota Aplikasi 2GB, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 65250, 65000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1061, '278', '278', 'Data INDOSAT', 'Indosat Freedom L', 'Kuota Dasar 4GB (2G/3G/4G) + Bonus 8GB (4G) + Kuota Aplikasi 2GB + 10GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 100450, 100200, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1062, '279', '279', 'Data INDOSAT', 'Indosat Freedom XL', 'Kuota Dasar 8GB (2G/3G/4G) + Bonus 12GB (4G) + Kuota Aplikasi 6GB + 15GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 149325, 149075, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1063, '280', '280', 'Data INDOSAT', 'Indosat Freedom XXL', 'Kuota Dasar 12GB (2G/3G/4G) + Bonus 25GB (4G) + Kuota Aplikasi 8GB + 20GB kuota malam, Unlimited nelpon ke sesama Operator Indosat. Masa aktif 30 hari.', 198825, 198575, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1064, '281', '281', 'Data INDOSAT', 'Indosat Freedom Apps Fun 2 GB / 7 Hari', 'Akses Youtube, Netflix, Spotify, Instagram, Facebook, Whatsapp, Line, Gojek, PUBG, Grab, dll.', 13350, 13100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1065, '282', '282', 'Data INDOSAT', 'Indosat Freedom Apps Fun 6 GB / 15 Hari', 'Akses Youtube, Netflix, Spotify, Instagram, Facebook, Whatsapp, Line, Gojek, PUBG, Grab, dll.', 25750, 25500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1066, '283', '283', 'Data INDOSAT', 'Indosat Freedom Apps Fun 10 GB / 30 Hari', 'Akses Youtube, Netflix, Spotify, Instagram, Facebook, Whatsapp, Line, Gojek, PUBG, Grab, dll.', 40750, 40500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1067, '284', '284', 'Data INDOSAT', 'Indosat Freedom Apps Edu 2 GB / 2 Hari', 'Akses Ruang Guru, Quippers, Zenius, Cakap, Rumah Belajar, Sekolahmu, Ayo Belajar, Kemendikbud, Google Classroom, Google Meet, Zoom, Microsoft Teams, dan Webex.', 4805, 4555, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1068, '285', '285', 'Data INDOSAT', 'Indosat Freedom Apps Edu 6 GB / 7 Hari', 'Akses Ruang Guru, Quippers, Zenius, Cakap, Rumah Belajar, Sekolahmu, Ayo Belajar, Kemendikbud, Google Classroom, Google Meet, Zoom, Microsoft Teams, dan Webex.', 10805, 10555, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1069, '286', '286', 'Data INDOSAT', 'Indosat Freedom Apps Edu 10 GB / 15 Hari', 'Akses Ruang Guru, Quippers, Zenius, Cakap, Rumah Belajar, Sekolahmu, Ayo Belajar, Kemendikbud, Google Classroom, Google Meet, Zoom, Microsoft Teams, dan Webex.', 16010, 15760, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1070, '287', '287', 'Data INDOSAT', 'Indosat Freedom Apps Edu 30 GB / 30 Hari', 'Akses Ruang Guru, Quippers, Zenius, Cakap, Rumah Belajar, Sekolahmu, Ayo Belajar, Kemendikbud, Google Classroom, Google Meet, Zoom, Microsoft Teams, dan Webex.', 32000, 31750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1071, '288', '288', 'Data AXIS', 'Axis Data Mini 1 GB / 5 Hari', '-', 8125, 7875, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1072, '289', '289', 'Data AXIS', 'Axis Data Mini 1 GB / 7 Hari', '-', 13325, 13075, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1073, '290', '290', 'Data AXIS', 'Axis Data Mini 2 GB / 5 Hari', '-', 9500, 9250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1074, '291', '291', 'Data AXIS', 'Axis Data Mini 3 GB / 5 Hari', '-', 16500, 16250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1075, '292', '292', 'Data AXIS', 'Axis Data Mini 5 GB / 5 Hari', '-', 20700, 20450, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1076, '293', '293', 'Data AXIS', 'Axis Data Mini 2 GB / 7 Hari', '-', 15475, 15225, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1077, '294', '294', 'Data AXIS', 'Axis Data Mini 3 GB / 15 Hari', '-', 19750, 19500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1078, '295', '295', 'Data AXIS', 'Axis Data Mini 5 GB / 15 Hari', '-', 30975, 30725, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1079, '296', '296', 'Data AXIS', 'Axis Data KZL Sosmed / 7 Hari', 'Unlimited Sosmed (FB/IG/Twitter), masa aktif 7 hari', 5750, 5500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1080, '297', '297', 'Data AXIS', 'Axis Data KZL Sosmed / 30 Hari', 'Unlimited Sosmed (FB/Twitter), masa aktif 30 hari', 15500, 15250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1081, '298', '298', 'Data AXIS', 'Axis Data KZL Chat / 7 Hari', 'Unlimited chat (WhatsApp/LINE/BBM), masa aktif 7 hari', 5750, 5500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1082, '299', '299', 'Data AXIS', 'Axis Data KZL Chat / 30 Hari', 'Unlimited chat (WhatsApp/LINE/BBM), masa aktif 30 hari', 15500, 15250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1083, '300', '300', 'Data AXIS', 'Axis Data KZL Sosmed + Chat / 7 Hari', 'Unlimited Sosmed (FB/IG/Twitter) + Chat (WhatsApp/LINE/BBM), masa aktif 7 hari', 7750, 7500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1084, '301', '301', 'Data AXIS', 'Axis Data KZL Sosmed + Chat / 30 Hari', 'Unlimited Sosmed (FB/Twitter) + Chat (WhatsApp/LINE/BBM), masa aktif 30 hari', 20250, 20000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1085, '302', '302', 'Data AXIS', 'Axis Data KZL Games Vainglory 500 MB / 7 Hari', 'Kuota Vainglory 500MB, masa aktif 7 hari', 5250, 5000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1086, '303', '303', 'Data AXIS', 'Axis Data KZL Games Vainglory 1 GB / 30 Hari', 'Kuota Vainglory 1GB, masa aktif 30 hari', 10400, 10150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1087, '304', '304', 'Data AXIS', 'Axis Data KZL Games AOV+Freefire 500 MB / 7 Hari', 'Kuota AOV+FreeFire 500MB, masa aktif 7 hari', 5250, 5000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1088, '305', '305', 'Data AXIS', 'Axis Data KZL Games AOV+Freefire 1 GB / 30 Hari', 'Kuota AOV+FreeFire 1GB, masa aktif 30 hari', 10400, 10150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1089, '306', '306', 'Data AXIS', 'BRONET 500 MB / 1 Hari', 'Kuota 500 MB, Masa aktif 1 Hari, 24 Jam', 8500, 8250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1090, '307', '307', 'Data AXIS', 'BRONET 300 MB / 7 Hari', 'Kuota 300 MB, Masa aktif 7 Hari, 24 Jam', 10185, 9935, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1091, '308', '308', 'Data AXIS', 'BRONET 1.5 GB / 7 Hari', 'Kuota 1.5 GB, Masa Aktif 7 Hari, 24 Jam', 13285, 13035, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1092, '309', '309', 'Data AXIS', 'BRONET 2 GB / 7 Hari', 'Kuota 2 GB, Masa Aktif 7 Hari, 24 Jam', 22525, 22275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1093, '310', '310', 'Data AXIS', 'BRONET 1 GB / 30 Hari', '24 jam', 13305, 13055, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP');
INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `multi`, `status`, `provider`, `tipe`, `server`) VALUES
(1094, '311', '311', 'Data AXIS', 'BRONET 2 GB / 30 Hari', '24 jam', 22505, 22255, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1095, '312', '312', 'Data AXIS', 'BRONET 3 GB / 30 Hari', 'Kuota 3GB. 24 Jam', 25500, 25250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1096, '313', '313', 'Data AXIS', 'BRONET 5 GB / 30 Hari', 'Kuota 5GB. 24 Jam', 42170, 41920, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1097, '314', '314', 'Data AXIS', 'BRONET 8 GB / 30 Hari', 'Kuota 8 GB, Masa Aktif 30 Hari, 24 Jam', 56550, 56300, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1098, '315', '315', 'Data AXIS', 'BRONET 10 GB / 30 hari', '-', 58725, 58475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1099, '316', '316', 'Data AXIS', 'BRONET 12 GB / 30 hari', '-', 67875, 67625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1100, '317', '317', 'Data AXIS', 'BRONET 15 GB / 30 hari', '-', 79000, 78750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1101, '318', '318', 'Data AXIS', 'BRONET 16 GB / 30 hari', '-', 80500, 80250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1102, '319', '319', 'Data AXIS', 'BRONET 25 GB / 30 hari', '-', 87100, 86850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1103, '320', '320', 'Data AXIS', 'BRONET 50 GB / 30 hari', '-', 135100, 134850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1104, '321', '321', 'Data AXIS', 'BRONET 2 GB / 60 hari', '2GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 24000, 23750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1105, '322', '322', 'Data AXIS', 'BRONET 3 GB / 60 hari', '3GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 34096, 33846, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1106, '323', '323', 'Data AXIS', 'BRONET 5 GB / 60 hari', '5GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 43500, 43250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1107, '324', '324', 'Data AXIS', 'BRONET 8 GB / 60 hari', '8GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 58000, 57750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1108, '325', '325', 'Data AXIS', 'BRONET 10 GB / 60 hari', '10GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 70500, 70250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1109, '326', '326', 'Data AXIS', 'BRONET 12 GB / 60 hari', '12GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 87310, 87060, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1110, '327', '327', 'Data AXIS', 'BRONET 16 GB / 60 hari', '16GB Kuota utama bisa digunakan selama 24 jam, berlaku 60hari.', 109295, 109045, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1111, '328', '328', 'Data AXIS', 'OWSEM 1 GB + 1 GB 4G / 30 Hari', 'BRONET 4G OWSEM 1GB+1GB(4G)+2GB Aplikasi, 24 jam 30HR', 17060, 16810, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1112, '329', '329', 'Data AXIS', 'OWSEM 1 GB + 3 GB 4G / 30 Hari', 'BRONET 4G OWSEM 1GB+3GB(4G)+4GB Aplikasi, 24 jam 30HR', 28600, 28350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1113, '330', '330', 'Data AXIS', 'OWSEM 2 GB + 6 GB 4G / 30 Hari', 'BRONET 4G OWSEM 2GB+6GB(4G)+8GB Aplikasi, 24 jam 30HR', 45225, 44975, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1114, '331', '331', 'Data AXIS', 'Axis OWSEM 16 GB + Unlimited Games / 30 Hari', 'Kuota Internet 24jam 2Gb + Kuota Sosmed 4Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 4Gb (Joox, Smule) + 6Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 39775, 39525, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1115, '332', '332', 'Data AXIS', 'Axis OWSEM 48 GB + Unlimited Games / 30 Hari', 'Kuota Internet 24jam 6Gb + Kuota Sosmed 12Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 12Gb (Joox, Smule) + 18Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 59345, 59095, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1116, '333', '333', 'Data AXIS', 'Axis OWSEM 80 GB + Unlimited Games / 30 Hari', 'Kuota Internet 24jam 10Gb + Kuota Sosmed 20Gb (FB, Twitter, IG, Tiktok) + Kuota Musik 20Gb (Joox, Smule) + 30Gb Kuota Malam 00-06 + Kuota Games Unlimited 1Gb /day (FreeFire, Mobile Legends, AOV, ASPHALT Legends, Vain Glory, Modern Combat 5)', 93912, 93662, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1117, '334', '334', 'Data AXIS', 'Axis Kuota Extra 1 GB Youtube / 30 Hari', 'Kuota dapat digunakan dengan syarat nomor yang di isi sedang berlanganan paket dengan masa aktif 30hr (bronet 30hr / owsem 30hr)', 5250, 5000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1118, '335', '335', 'Data AXIS', 'Axis Kuota Extra 2 GB Youtube / 30 Hari', 'Kuota dapat digunakan dengan syarat nomor yang di isi sedang berlanganan paket dengan masa aktif 30hr (bronet 30hr / owsem 30hr)', 8100, 7850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1119, '336', '336', 'Data AXIS', 'Axis Kuota Extra 1 GB SOSMED / 30 Hari', 'Kuota dapat digunakan dengan syarat nomor yang di isi sedang berlanganan paket dengan masa aktif 30hr (bronet 30hr / owsem 30hr), aplikasi FB,IG,Twitter,Tiktok dan Tinder', 5250, 5000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1120, '337', '337', 'Data AXIS', 'Axis Kuota Extra 2 GB SOSMED / 30 Hari', 'Kuota dapat digunakan dengan syarat nomor yang di isi sedang berlanganan paket dengan masa aktif 30hr (bronet 30hr / owsem 30hr), aplikasi FB,IG,Twitter,Tiktok dan Tinder', 8100, 7850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1121, '338', '338', 'Data TRI', 'Tri Data 100 MB / 30 Hari', 'Tri Data 100 MB / 30 Hari', 1400, 1150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1122, '339', '339', 'Data TRI', 'Tri Data 200 MB / 30 Hari', 'Tri Data 200 MB / 30 Hari', 1960, 1710, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1123, '340', '340', 'Data TRI', 'Tri Data 500 MB / 30 Hari', 'Tri Data 500 MB / 30 Hari', 4080, 3830, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1124, '341', '341', 'Data TRI', 'Tri Data 1 GB / 30 Hari', 'Tri Data 1 GB / 30 Hari', 7700, 7450, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1125, '342', '342', 'Data TRI', 'Tri Data 2 GB / 30 Hari', 'Tri Data 2 GB / 30 Hari', 14725, 14475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1126, '343', '343', 'Data TRI', 'Tri Data 5 GB / 30 Hari', 'Tri Data 5 GB / 30 Hari', 35800, 35550, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1127, '344', '344', 'Data TRI', 'Tri Data 10 GB / 30 Hari', 'Kuota 10GB ( 2G/3G/4G ) 24 JAM masa aktif 30 hari', 47500, 47250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1128, '345', '345', 'Data TRI', 'Tri Data 15 GB / 30 Hari', 'Kuota 15GB ( 2G/3G/4G ) 24 JAM masa aktif 30 hari', 57500, 57250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1129, '346', '346', 'Data TRI', 'Tri Data 20 GB / 30 Hari', 'Kuota 20GB ( 2G/3G/4G ) 24 JAM masa aktif 30 hari', 70500, 70250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1130, '347', '347', 'Data TRI', 'Tri Data 30 GB / 30 Hari', 'Kuota 30GB ( 2G/3G/4G ) 24 JAM masa aktif 30 hari', 98500, 98250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1131, '348', '348', 'Data TRI', 'Tri Data 50 GB / 30 Hari', 'Kuota 50GB ( 2G/3G/4G ) 24 JAM masa aktif 30 hari', 120775, 120525, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1132, '349', '349', 'Data TRI', 'Tri Tambah Masa Aktif Kartu  4 Bulan', '-', 7600, 7350, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1133, '350', '350', 'Data TRI', 'Tri Data H3RO 9 GB / 30 Hari', '2 GB kuota utama + 7 GB kuota Games + 30 Menit Telepon Sesama Tri, masa aktif 30 Hari (sesuai zona/area)', 28355, 28105, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1134, '351', '351', 'Data TRI', 'Tri Data 22 GB + Unlimited YouTube dan VIU / 30 Hari', '4GB Kuota AON (aktif selamanya), 8GB Kuota Bulanan (24 jam di Semua Jaringan Tri Indonesia), 10GB Kuota Malam (berlaku 01-06 di Semua Jaringan Tri Indonesia), Unlimited akses YouTube/VIU/Netflix (FUP 1 GB/hari)', 66295, 66045, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1135, '352', '352', 'Data TRI', 'Tri Data 1 GB / 7 Hari', '-', 15275, 15025, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1136, '353', '353', 'Data TRI', 'Tri Data 2.75 GB / 7 Hari', '750MB + 2 GB 4G, 7 Hari', 15275, 15025, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1137, '354', '354', 'Data TRI', 'Tri Data 1 GB / 14 Hari', '-', 20250, 20000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1138, '355', '355', 'Data TRI', 'Tri Data 4G 10 GB / 30 Hari', '2 GB + 8GB 4G + Content, 30 Hari', 49650, 49400, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1139, '356', '356', 'Data TRI', 'Tri Data 4G 12 GB / 30 Hari', '2 GB + 8GB 4G + 2 GB (Youtube/Netflix), 30 Hari', 50000, 49750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1140, '357', '357', 'Data TRI', 'Tri Data 4G 15 GB / 30 Hari', '3 GB + 9GB 4G + 3 GB (Youtube/Netflix) 30 Hari', 70500, 70250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1141, '358', '358', 'Data TRI', 'Tri Data 10 GB( Semua Jaringan) + 10GB ( Youtube + Netflix) / 30 Hari', '10 GB( Semua Jaringan) + 10GB ( Youtube + Netflix) 30 Hari', 69250, 69000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1142, '359', '359', 'Data TRI', 'Tri Data 4G 32 GB / 30 Hari', '2 GB + 30GB (1 GB/hari 4G) 30 Hari', 60150, 59900, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1143, '360', '360', 'Data TRI', 'Tri Data 12 GB / 30 Hari', '10GB Regular + 2GB Youtube/Netflix, 30 Hari', 54525, 54275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1144, '361', '361', 'Data TRI', 'Kuota++ 80MB Semua Jaringan 1 Hari', '-', 5255, 5005, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1145, '362', '362', 'Data TRI', 'Tri Data ++ 20 MB', 'Kuota 20 MB mengikuti masa aktif kartu', 2405, 2155, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1146, '363', '363', 'Data TRI', 'Tri Data ++ 650 MB', 'Kuota 650 MB mengikuti masa aktif kartu', 19760, 19510, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1147, '364', '364', 'Data TRI', 'Tri Data 2 GB + 20 Menit Telepon / 30 Hari', '-', 35250, 35000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1148, '366', '366', 'Data TRI', '1GB Nasional + 4GB (01.00 - 09.00) 1 Hari', '-', 5455, 5205, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1149, '367', '367', 'Data TRI', '300 MB (semua jaringan) Mengikuti Masa Aktif Kartu', '-', 10500, 10250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1150, '368', '368', 'Data TRI', '500 MB (semua jaringan) + 1 GB (Youtube + Netflix) 3Hari', '-', 10500, 10250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1151, '369', '369', 'Data TRI', '5GB + 4GB (01 Pagi - 12 Siang) + 10 Menit Telepon All Op 7 Hari', '-', 35250, 35000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1152, '370', '370', 'Data TRI', '5 GB Semua Jaringan + 20 Menit Telepon + SMS Semua Op + TRIXOGO + VIU 7 Hari', '-', 29675, 29425, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1153, '371', '371', 'Data TRI', '8,5 GB +100 Menit Telepon + SMS Semua Op + TRIXOGO + VIU 30 Hari', '-', 60950, 60700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1154, '372', '372', 'Data TRI', 'AlwaysOn 1.5 GB', '1.5 GB Nasional, Mengikuti Masa Aktif Kartu', 12910, 12660, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1155, '373', '373', 'Data TRI', 'AlwaysOn 2 GB', '2 GB Nasional, Mengikuti Masa Aktif Kartu', 17095, 16845, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1156, '374', '374', 'Data TRI', 'AlwaysOn 3 GB', '3 GB Nasional, Mengikuti Masa Aktif Kartu', 23725, 23475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1157, '375', '375', 'Data TRI', 'AlwaysOn 8 GB', '8 GB Nasional, Mengikuti Masa Aktif Kartu', 42725, 42475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1158, '376', '376', 'Data TRI', 'AlwaysOn 16 GB', '16 GB Nasional, Mengikuti Masa Aktif Kartu', 80525, 80275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1159, '377', '377', 'Data TRI', 'AlwaysOn 50 GB', '50 GB Nasional, Mengikuti Masa Aktif Kartu', 185950, 185700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1160, '378', '378', 'Data TRI', 'AlwaysOn 80 GB', '80 GB Nasional, Mengikuti Masa Aktif Kartu', 281250, 281000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1161, '379', '379', 'Data TRI', 'AlwaysOn 150 GB', '150 GB Nasional, Mengikuti Masa Aktif Kartu', 472350, 472100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1162, '380', '380', 'Data TRI', 'AlwaysOn 300 GB', '300 GB Nasional, Mengikuti Masa Aktif Kartu', 852350, 852100, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1163, '381', '381', 'Data TRI', 'AlwaysOn 6 GB + Unlimited', '6 GB Nasional, Mengikuti Masa Aktif Kartu. Unlimited Aplikasi 30 Hari Pukul 01.00 - 17.00 WIB, batas pemakaian wajar 1,5GB per hari.', 57725, 57475, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1164, '382', '382', 'Data TRI', 'AlwaysOn 10 GB + Unlimited', '10 GB Nasional, Mengikuti Masa Aktif Kartu. Unlimited Aplikasi 30 Hari Pukul 01.00 - 17.00 WIB, batas pemakaian wajar 1,5GB per hari.', 78525, 78275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1165, '383', '383', 'Data TRI', 'AlwaysOn 16 GB + Unlimited', '16 GB Nasional, Mengikuti Masa Aktif Kartu, Unlimited Aplikasi 30 Hari Pukul 01.00 - 17.00 WIB, batas pemakaian wajar 1,5GB per hari.', 102742, 102492, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1166, '384', '384', 'Data TRI', 'Tri Data AON 1 GB + Bonus 1 GB', '-', 22000, 21750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1167, '385', '385', 'Data TRI', 'Tri Data AON 2 GB + Bonus 4 GB', '-', 38300, 38050, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1168, '386', '386', 'Data TRI', 'Tri Data AON 3 GB + Bonus 6 GB', '-', 69525, 69275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1169, '389', '389', 'Data TRI', 'Tri Data AON 8 GB + Bonus 16 GB', '-', 105500, 105250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1170, '390', '390', 'Games FREE FIRE', 'Free Fire 20 Diamond', 'Free Fire 20 Diamond', 3505, 3255, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1171, '391', '391', 'Games FREE FIRE', 'Free Fire 25 Diamond', 'Free Fire 25 Diamond', 4355, 4105, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1172, '392', '392', 'Games FREE FIRE', 'Free Fire 30 Diamond', 'Free Fire 30 Diamond', 5000, 4750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1173, '393', '393', 'Games FREE FIRE', 'Free Fire 40 Diamond', 'Free Fire 40 Diamond', 6100, 5850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1174, '394', '394', 'Games FREE FIRE', 'Free Fire 50 Diamond', 'Free Fire 50 Diamond', 7000, 6750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1175, '395', '395', 'Games FREE FIRE', 'Free Fire 55 Diamond', 'Free Fire 55 Diamond', 8390, 8140, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1176, '396', '396', 'Games FREE FIRE', 'Free Fire 70 Diamond', 'Free Fire 70 Diamond', 9515, 9265, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1177, '398', '398', 'Games FREE FIRE', 'Free Fire 95 Diamond', 'Free Fire 95 Diamond', 13163, 12913, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1178, '399', '399', 'Games FREE FIRE', 'Free Fire 100 Diamond', 'Free Fire 100 Diamond', 13714, 13464, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1179, '400', '400', 'Games FREE FIRE', 'Free Fire 130 Diamond', 'Free Fire 130 Diamond', 18500, 18250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1180, '401', '401', 'Games FREE FIRE', 'Free Fire 140 Diamond', 'Free Fire 140 Diamond', 18527, 18277, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1181, '402', '402', 'Games FREE FIRE', 'Free Fire 145 Diamond', 'Free Fire 145 Diamond', 20300, 20050, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1182, '404', '404', 'Games FREE FIRE', 'Free Fire 210 Diamond', 'Free Fire 210 Diamond', 27737, 27487, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1183, '403', '403', 'Games FREE FIRE', 'Free Fire 150 Diamond', '-', 20750, 20500, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1184, '405', '405', 'Games FREE FIRE', 'Free Fire 250 Diamond', 'Free Fire 250 Diamond', 34525, 34275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1185, '406', '406', 'Games FREE FIRE', 'Free Fire 280 Diamond', 'Free Fire 280 Diamond', 37475, 37225, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1186, '407', '407', 'Games FREE FIRE', 'Free Fire 350 Diamond', 'Free Fire 350 Diamond', 46700, 46450, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1187, '408', '408', 'Games FREE FIRE', 'Free Fire 355 Diamond', 'Free Fire 355 Diamond', 45545, 45295, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1188, '409', '409', 'Games FREE FIRE', 'Free Fire 400 Diamond', 'Free Fire 400 Diamond', 55500, 55250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1189, '410', '410', 'Games FREE FIRE', 'Free Fire 425 Diamond', 'Free Fire 425 Diamond', 55125, 54875, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1190, '411', '411', 'Games FREE FIRE', 'Free Fire 500 Diamond', 'Free Fire 500 Diamond', 65150, 64900, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1191, '412', '412', 'Games FREE FIRE', 'Free Fire 510 Diamond', 'Free Fire 510 Diamond', 66445, 66195, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1192, '413', '413', 'Games FREE FIRE', 'Free Fire 512 Diamond', 'Free Fire 512 Diamond', 69500, 69250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1193, '414', '414', 'Games FREE FIRE', 'Free Fire 545 Diamond', 'Free Fire 545 Diamond', 74450, 74200, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1194, '415', '415', 'Games FREE FIRE', 'Free Fire 600 Diamond', 'Free Fire 600 Diamond', 82500, 82250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1195, '416', '416', 'Games FREE FIRE', 'Free Fire 720 Diamond', 'Free Fire 720 Diamond', 90670, 90420, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1196, '417', '417', 'Games FREE FIRE', 'Free Fire 800 Diamond', 'Free Fire 800 Diamond', 108500, 108250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1197, '418', '418', 'Games FREE FIRE', 'Free Fire 860 Diamond', 'Free Fire 860 Diamond', 111025, 110775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1198, '419', '419', 'Games FREE FIRE', 'Free Fire 925 Diamond', 'Free Fire 925 Diamond', 118642, 118392, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1199, '420', '420', 'Games FREE FIRE', 'Free Fire 1050 Diamond', 'Free Fire 1050 Diamond', 141525, 141275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1200, '421', '421', 'Games FREE FIRE', 'Free Fire 1075 Diamond', 'Free Fire 1075 Diamond', 136660, 136410, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1201, '422', '422', 'Games FREE FIRE', 'Free Fire 1200 Diamond', 'Free Fire 1200 Diamond', 153140, 152890, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1202, '423', '423', 'Games FREE FIRE', 'Free Fire 1300 Diamond', 'Free Fire 1300 Diamond', 173225, 172975, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1203, '424', '424', 'Games FREE FIRE', 'Free Fire 1450 Diamond', 'Free Fire 1450 Diamond', 184550, 184300, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1204, '425', '425', 'Games FREE FIRE', 'Free Fire 1875 Diamond', 'Free Fire 1875 Diamond', 238397, 238147, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1205, '426', '426', 'Games FREE FIRE', 'Free Fire 1975 Diamond', 'Free Fire 1975 Diamond', 252228, 251978, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1206, '427', '427', 'Games FREE FIRE', 'Free Fire 2000 Diamond', 'Free Fire 2000 Diamond', 246500, 246250, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1207, '428', '428', 'Games FREE FIRE', 'Free Fire 2575 Diamond', 'Free Fire 2575 Diamond', 322525, 322275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1208, '429', '429', 'Games FREE FIRE', 'Free Fire 3000 Diamond', 'Free Fire 3000 Diamond', 375351, 375101, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1209, '430', '430', 'Games FREE FIRE', 'Free Fire 6550 Diamond', 'Free Fire 6550 Diamond', 847525, 847275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1210, '431', '431', 'Games FREE FIRE', 'Free Fire 7650 Diamond', 'Free Fire 7650 Diamond', 1000500, 1000250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1211, '432', '432', 'Games FREE FIRE', 'Free Fire 9800 Diamond', 'Free Fire 9800 Diamond', 1200500, 1200250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1212, '433', '433', 'Games FREE FIRE', 'Free Fire 36500 Diamond', 'Free Fire 36500 Diamond', 4700500, 4700250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1213, '434', '434', 'Games FREE FIRE', 'Free Fire 73100 Diamond', 'Free Fire 73100 Diamond', 9500500, 9500250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1214, '1554', '1554', 'Games PUBG MOBILE', 'PUBG MOBILE 26 UC', 'PUBG MOBILE 26 UC', 5250, 5000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1215, '1555', '1555', 'Games PUBG MOBILE', 'PUBG MOBILE 35 UC', 'PUBG MOBILE 35 UC', 8100, 7850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1216, '1556', '1556', 'Games PUBG MOBILE', 'PUBG MOBILE 50 UC', 'PUBG MOBILE 50 UC', 10095, 9845, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1217, '1557', '1557', 'Games PUBG MOBILE', 'PUBG MOBILE 52 UC', 'PUBG MOBILE 52 UC', 9750, 9500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1218, '1558', '1558', 'Games PUBG MOBILE', 'PUBG MOBILE 70 UC', 'PUBG MOBILE 70 UC', 14655, 14405, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1219, '1559', '1559', 'Games PUBG MOBILE', 'PUBG MOBILE 73 UC', 'PUBG MOBILE 73 UC', 14350, 14100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1220, '1560', '1560', 'Games PUBG MOBILE', 'PUBG MOBILE 100 UC', 'PUBG MOBILE 100 UC', 19605, 19355, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1221, '1561', '1561', 'Games PUBG MOBILE', 'PUBG MOBILE 105 UC', 'PUBG MOBILE 105 UC', 19075, 18825, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1222, '1562', '1562', 'Games PUBG MOBILE', 'PUBG MOBILE 125 UC', 'PUBG MOBILE 125 UC', 23755, 23505, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1223, '1563', '1563', 'Games PUBG MOBILE', 'PUBG MOBILE 131 UC', 'PUBG MOBILE 131 UC', 23750, 23500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1224, '1564', '1564', 'Games PUBG MOBILE', 'PUBG MOBILE 150 UC', 'PUBG MOBILE 150 UC', 32020, 31770, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1225, '1565', '1565', 'Games PUBG MOBILE', 'PUBG MOBILE 210 UC', 'PUBG MOBILE 210 UC', 41170, 40920, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1226, '1566', '1566', 'Games PUBG MOBILE', 'PUBG MOBILE 221 UC', 'PUBG MOBILE 221 UC', 41050, 40800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1227, '1567', '1567', 'Games PUBG MOBILE', 'PUBG MOBILE 250 UC', 'PUBG MOBILE 250 UC', 46270, 46020, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1228, '1568', '1568', 'Games PUBG MOBILE', 'PUBG MOBILE 263 UC', 'PUBG MOBILE 263 UC', 46800, 46550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1229, '1569', '1569', 'Games PUBG MOBILE', 'PUBG MOBILE 500 UC', 'PUBG MOBILE 500 UC', 92600, 92350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1230, '1570', '1570', 'Games PUBG MOBILE', 'PUBG MOBILE 530 UC', 'PUBG MOBILE 530 UC', 92900, 92650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1231, '1571', '1571', 'Games PUBG MOBILE', 'PUBG MOBILE 600 UC', 'PUBG MOBILE 600 UC', 111050, 110800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1232, '1572', '1572', 'Games PUBG MOBILE', 'PUBG MOBILE 700 UC', 'PUBG MOBILE 700 UC', 133770, 133520, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1233, '1573', '1573', 'Games PUBG MOBILE', 'PUBG MOBILE 750 UC', 'PUBG MOBILE 750 UC', 134500, 134250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1234, '1574', '1574', 'Games PUBG MOBILE', 'PUBG MOBILE 770 UC', 'PUBG MOBILE 770 UC', 135750, 135500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1235, '1575', '1575', 'Games PUBG MOBILE', 'PUBG MOBILE 800 UC', 'PUBG MOBILE 800 UC', 150000, 149750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1236, '1576', '1576', 'Games PUBG MOBILE', 'PUBG MOBILE 1000 UC', 'PUBG MOBILE 1000 UC', 182800, 182550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1237, '1577', '1577', 'Games PUBG MOBILE', 'PUBG MOBILE 1100 UC', 'PUBG MOBILE 1100 UC', 184750, 184500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1238, '1578', '1578', 'Games PUBG MOBILE', 'PUBG MOBILE 1250 UC', 'PUBG MOBILE 1250 UC', 262070, 261820, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1239, '1579', '1579', 'Games PUBG MOBILE', 'PUBG MOBILE 1375 UC', 'PUBG MOBILE 1375 UC', 240600, 240350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1240, '1580', '1580', 'Games PUBG MOBILE', 'PUBG MOBILE 1500 UC', 'PUBG MOBILE 1500 UC', 275525, 275275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1241, '1581', '1581', 'Games PUBG MOBILE', 'PUBG MOBILE 1638 UC', 'PUBG MOBILE 1638 UC', 281500, 281250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1242, '1582', '1582', 'Games PUBG MOBILE', 'PUBG MOBILE 1750 UC', 'PUBG MOBILE 1750 UC', 333500, 333250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1243, '1583', '1583', 'Games PUBG MOBILE', 'PUBG MOBILE 2013 UC', 'PUBG MOBILE 2013 UC', 329675, 329425, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1244, '1584', '1584', 'Games PUBG MOBILE', 'PUBG MOBILE 2163 UC', 'PUBG MOBILE 2163 UC', 375850, 375600, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1245, '1585', '1585', 'Games PUBG MOBILE', 'PUBG MOBILE 2425 UC', 'PUBG MOBILE 2425 UC', 422350, 422100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1246, '1586', '1586', 'Games PUBG MOBILE', 'PUBG MOBILE 2500 UC', 'PUBG MOBILE 2500 UC', 487570, 487320, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1247, '1587', '1587', 'Games PUBG MOBILE', 'PUBG MOBILE 2730 UC', 'PUBG MOBILE 2730 UC', 468200, 467950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1248, '1588', '1588', 'Games PUBG MOBILE', 'PUBG MOBILE 3925 UC', 'PUBG MOBILE 3925 UC', 659350, 659100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1249, '1590', '1590', 'Games PUBG MOBILE', 'PUBG MOBILE 4200 UC', 'PUBG MOBILE 4200 UC', 687850, 687600, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1250, '1591', '1591', 'Games PUBG MOBILE', 'PUBG MOBILE 4400 UC', 'PUBG MOBILE 4400 UC', 759150, 758900, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1251, '1592', '1592', 'Games PUBG MOBILE', 'PUBG MOBILE 4663 UC', 'PUBG MOBILE 4663 UC', 824250, 824000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1252, '1593', '1593', 'Games PUBG MOBILE', 'PUBG MOBILE 4930 UC', 'PUBG MOBILE 4930 UC', 875500, 875250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1253, '1594', '1594', 'Games PUBG MOBILE', 'PUBG MOBILE 5000 UC', 'PUBG MOBILE 5000 UC', 1002320, 1002070, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1254, '435', '435', 'Games PUBG MOBILE', 'PUBG MOBILE 6000 UC', 'PUBG MOBILE 6000 UC', 1008500, 1008250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1255, '436', '436', 'Games PUBG MOBILE', 'PUBG MOBILE 6600 UC', 'PUBG MOBILE 6600 UC', 1115000, 1114750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1256, '437', '437', 'Games PUBG MOBILE', 'PUBG MOBILE 7000 UC', 'PUBG MOBILE 7000 UC', 1341125, 1340875, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1257, '438', '438', 'Games PUBG MOBILE', 'PUBG MOBILE 7700 UC', 'PUBG MOBILE 7700 UC', 1299700, 1299450, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1258, '439', '439', 'Games PUBG MOBILE', 'PUBG MOBILE 8750 UC', 'PUBG MOBILE 8750 UC', 1330000, 1329750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1259, '440', '440', 'Games PUBG MOBILE', 'PUBG MOBILE 9900 UC', 'PUBG MOBILE 9900 UC', 1669950, 1669700, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1260, '441', '441', 'Games PUBG MOBILE', 'PUBG MOBILE 10005 UC', 'PUBG MOBILE 10005 UC', 1694500, 1694250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1261, '442', '442', 'Games PUBG MOBILE', 'PUBG MOBILE 12263 UC', 'PUBG MOBILE 12263 UC', 1935900, 1935650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1262, '443', '443', 'Games Call of Duty MOBILE', 'COD 26', 'Call of Duty Mobile 26CP', 5300, 5050, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1263, '444', '444', 'Games Call of Duty MOBILE', 'COD 53', 'Call of Duty Mobile 53CP', 10100, 9850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1264, '445', '445', 'Games Call of Duty MOBILE', 'COD 106', 'Call of Duty Mobile 106CP', 19600, 19350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1265, '446', '446', 'Games Call of Duty MOBILE', 'COD 264', 'Call of Duty Mobile 264CP', 48100, 47850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1266, '447', '447', 'Games Call of Duty MOBILE', 'COD 528', 'Call of Duty Mobile 528CP', 95600, 95350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1267, '448', '448', 'Games Call of Duty MOBILE', 'COD 1056', 'Call of Duty Mobile 1056CP', 190800, 190550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1268, '449', '449', 'Games Call of Duty MOBILE', 'COD 1584', 'Call of Duty Mobile 1584', 285600, 285350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1269, '450', '450', 'Games Call of Duty MOBILE', 'COD 2640', 'Call of Duty Mobile 2640CP', 475900, 475650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1270, '451', '451', 'Games Call of Duty MOBILE', 'COD 5280', 'Call of Duty Mobile 5280CP', 952000, 951750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1271, '452', '452', 'Games Call of Duty MOBILE', 'COD 10560', 'Call of Duty Mobile 10560CP', 1935500, 1935250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1272, '453', '453', 'Games Call of Duty MOBILE', 'COD 26400', 'Call of Duty Mobile 26400CP', 4840500, 4840250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1273, '454', '454', 'Games Call of Duty MOBILE', 'COD 52800', 'Call of Duty Mobile 52800CP', 9675500, 9675250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1274, '455', '455', 'Games Speed Drifters', 'Speed Drifters 10 Diamonds', '10 Diamonds', 2440, 2190, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1275, '456', '456', 'Games Speed Drifters', 'Speed Drifters 25 Diamonds', '25 Diamonds', 5350, 5100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1276, '457', '457', 'Games Speed Drifters', 'Speed Drifters 56 Diamonds', '56 Diamonds', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1277, '458', '458', 'Games Speed Drifters', 'Speed Drifters 112 Diamonds', '112 Diamonds', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1278, '459', '459', 'Games Speed Drifters', 'Speed Drifters 282 Diamonds', '282 Diamonds', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1279, '460', '460', 'Games Speed Drifters', 'Speed Drifters 579 Diamonds', '579 Diamonds', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1280, '461', '461', 'Games Speed Drifters', 'Speed Drifters 1230 Diamonds', '1230 Diamonds', 194500, 194250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1281, '462', '462', 'Games Speed Drifters', 'Speed Drifters 1845 Diamonds', '1845 Diamonds', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1282, '463', '463', 'Games Speed Drifters', 'Speed Drifters 3134 Diamonds', '3134 Diamonds', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1283, '464', '464', 'Games Speed Drifters', 'Speed Drifters 6279 Diamonds', '6279 Diamonds', 970500, 970250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1284, '465', '465', 'Games Speed Drifters', 'Speed Drifters 31450 Diamonds', '31450 Diamonds', 4850500, 4850250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1285, '466', '466', 'Games Speed Drifters', 'Speed Drifters 63000 Diamonds', '63000 Diamonds', 9700500, 9700250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1286, '467', '467', 'Games King of Kings', 'King of Kings 255 Coupons', '-', 58700, 58450, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1287, '468', '468', 'Games King of Kings', 'King of Kings 319 Coupons', '-', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1288, '469', '469', 'Games King of Kings', 'King of Kings 426 Coupons', '-', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1289, '470', '470', 'Games King of Kings', 'King of Kings 638 Coupons', '-', 146000, 145750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1290, '471', '471', 'Games King of Kings', 'King of Kings 1064 Coupons', '-', 243000, 242750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1291, '472', '472', 'Games King of Kings', 'King of Kings 1277 Coupons', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1292, '473', '473', 'Games King of Kings', 'King of Kings 2128 Coupons', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1293, '474', '474', 'Games King of Kings', 'King of Kings 4255 Coupons', '-', 970500, 970250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1294, '475', '475', 'Games Higgs Domino', 'Higgs Domino 1M Koin Emas-D', '-', 730, 480, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1295, '476', '476', 'Games Higgs Domino', 'Higgs Domino 10M Koin Emas-D', '-', 2600, 2350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1296, '477', '477', 'Games Higgs Domino', 'Higgs Domino 15M Koin Emas-D', '-', 3200, 2950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1297, '478', '478', 'Games Higgs Domino', 'Higgs Domino 30M Koin Emas-D', '-', 5325, 5075, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1298, '479', '479', 'Games Higgs Domino', 'Higgs Domino 60M Koin Emas-D', '-', 6500, 6250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1299, '480', '480', 'Games Higgs Domino', 'Higgs Domino 100M Koin Emas-D', '-', 14510, 14260, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1300, '481', '481', 'Games Higgs Domino', 'Higgs Domino 120M Koin Emas-D', '-', 13000, 12750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1301, '482', '482', 'Games Higgs Domino', 'Higgs Domino 200M Koin Emas-D', '-', 19500, 19250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1302, '483', '483', 'Games Higgs Domino', 'Higgs Domino 400M Koin Emas-D', '-', 36500, 36250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1303, '484', '484', 'Games Higgs Domino', 'Higgs Domino 600M Koin Emas-D', '-', 55500, 55250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1304, '485', '485', 'Games Higgs Domino', 'Higgs Domino 800M Koin Emas-D', '-', 71500, 71250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1305, '486', '486', 'Games Higgs Domino', 'Higgs Domino 1B Koin Emas-D', '-', 69500, 69250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1306, '487', '487', 'Games Higgs Domino', 'Higgs Domino 2B Koin Emas-D', '-', 145500, 145250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1307, '488', '488', 'Games Higgs Domino', 'Higgs Domino 3B Koin Emas-D', '-', 338000, 337750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1308, '489', '489', 'Games Higgs Domino', 'Higgs Domino 4B Koin Emas-D', '-', 450500, 450250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1309, '490', '490', 'Games Higgs Domino', 'Higgs Domino 5B Koin Emas-D', '-', 342500, 342250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1310, '491', '491', 'Games Higgs Domino', 'Higgs Domino 6B Koin Emas-D', '-', 415500, 415250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1311, '492', '492', 'Games Higgs Domino', 'Higgs Domino 7B Koin Emas-D', '-', 480500, 480250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1312, '493', '493', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 45.5M Koin', '-', 5350, 5100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1313, '494', '494', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 50M Koin', '-', 5835, 5585, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1314, '495', '495', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 97.5M Koin', '-', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1315, '496', '496', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 107.2M Koin', '-', 11170, 10920, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1316, '497', '497', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 200.2M Koin', '-', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1317, '498', '498', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 220.2M Koin', '-', 21840, 21590, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1318, '499', '499', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 338.9M Koin', '-', 32510, 32260, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1319, '500', '500', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 533M Koin', '-', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1320, '501', '501', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 586.3M Koin', '-', 53850, 53600, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1321, '502', '502', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 819M Koin', '-', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1322, '503', '503', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 1.12B Koin', '-', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1323, '504', '504', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 1.23B Koin', '-', 107200, 106950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1324, '505', '505', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 2.29B Koin', '-', 194500, 194250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1325, '506', '506', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 3.63B Koin', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1326, '507', '507', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 3.99B Koin', '-', 320600, 320350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1327, '508', '508', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 6.18B Koin', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1328, '509', '509', 'Games Boyaa Capsa Susun', 'Boyaa Capsa Susun 13B Koin', '-', 970500, 970250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1329, '510', '510', 'Games Poker Texas', 'Poker Texa 22M Koin', '-', 5400, 5150, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1330, '511', '511', 'Games Poker Texas', 'Poker Texa 45M Koin', '-', 10300, 10050, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1331, '512', '512', 'Games Poker Texas', 'Poker Texas 100M Koin', '-', 20100, 19850, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1332, '513', '513', 'Games Poker Texas', 'Poker Texas 165M Koin', '-', 29900, 29650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1333, '514', '514', 'Games Poker Texas', 'Poker Texas 300M Koin', '-', 49500, 49250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1334, '515', '515', 'Games Poker Texas', 'Poker Texas 450M Koin', '-', 74000, 73750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1335, '516', '516', 'Games Poker Texas', 'Poker Texas 1.6B Koin', '-', 196500, 196250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1336, '517', '517', 'Games Poker Texas', 'Poker Texas 2.55B Koin', '-', 294500, 294250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1337, '518', '518', 'Games Poker Texas', 'Poker Texas 4.5B Koin', '-', 490500, 490250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1338, '519', '519', 'Games Poker Texas', 'Poker Texas 10.4B Koin', '-', 980500, 980250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1339, '520', '520', 'Games Poker Texas', 'Poker Texas 21B Koin', '-', 1960500, 1960250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1340, '521', '521', 'Games Ride Out Heroes', 'Ride Out Heroes 100 Tokens', '-', 14510, 14260, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1341, '522', '522', 'Games Ride Out Heroes', 'Ride Out Heroes 300 Token', '-', 42525, 42275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1342, '523', '523', 'Games Ride Out Heroes', 'Ride Out Heroes 500 Token', '-', 70800, 70550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1343, '524', '524', 'Games Ride Out Heroes', 'Ride Out Heroes 1000 Tokens', '-', 141025, 140775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1344, '525', '525', 'Games Ride Out Heroes', 'Ride Out Heroes 2000 Tokens', '-', 281525, 281275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1345, '526', '526', 'Games Ride Out Heroes', 'Ride Out Heroes 3000 Tokens', '-', 422025, 421775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1346, '527', '527', 'Games Ride Out Heroes', 'Ride Out Heroes 5000 Tokens', '-', 703525, 703275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1347, '528', '528', 'Games Ride Out Heroes', 'Ride Out Heroes 10000 Tokens', '-', 1405525, 1405275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1348, '529', '529', 'Games LifeAfter Credits', 'LifeAfter 65 Credits', '-', 14565, 14315, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1349, '530', '530', 'Games LifeAfter Credits', 'LifeAfter 330 Credits', '-', 70825, 70575, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1350, '531', '531', 'Games LifeAfter Credits', 'LifeAfter 558 Credits', '-', 113020, 112770, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1351, '532', '532', 'Games LifeAfter Credits', 'LifeAfter 1108 Credits', '-', 211475, 211225, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1352, '533', '533', 'Games LifeAfter Credits', 'LifeAfter 3468 Credits', '-', 661555, 661305, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1353, '534', '534', 'Games LifeAfter Credits', 'LifeAfter 5768 Credits', '-', 1055375, 1055125, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1354, '535', '535', 'Games LifeAfter Credits', 'LifeAfter 7768 Credits', '-', 1407000, 1406750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1355, '536', '536', 'Games IndoPlay', 'IndoPlay 100 Mango', '-', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1356, '537', '537', 'Games IndoPlay', 'IndoPlay 200 Mango', '-', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1357, '538', '538', 'Games IndoPlay', 'IndoPlay 500 Mango', '-', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1358, '539', '539', 'Games IndoPlay', 'IndoPlay 1000 Mango', '-', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1359, '540', '540', 'Games IndoPlay', 'IndoPlay 3000 Mango', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1360, '541', '541', 'Games IndoPlay', 'IndoPlay 5000 Mango', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1361, '542', '542', 'Games Scroll of Onmyoji', 'Sakura & Sword 90 Gioks', 'Sakura & Sword 90 Gioks', 14565, 14315, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1362, '543', '543', 'Games Scroll of Onmyoji', 'Sakura & Sword 450 Gioks', 'Sakura & Sword 450 Gioks', 70825, 70575, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1363, '544', '544', 'Games Scroll of Onmyoji', 'Sakura & Sword 900 Gioks', 'Sakura & Sword 900 Gioks', 141150, 140900, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1364, '545', '545', 'Games Scroll of Onmyoji', 'Sakura & Sword 1350 Gioks', 'Sakura & Sword 1350 Gioks', 211475, 211225, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1365, '546', '546', 'Games Scroll of Onmyoji', 'Sakura & Sword 1840 Gioks', 'Sakura & Sword 1840 Gioks', 281800, 281550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1366, '547', '547', 'Games Scroll of Onmyoji', 'Sakura & Sword 5000 Gioks', 'Sakura & Sword 5000 Gioks', 703750, 703500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1367, '548', '548', 'Games Scroll of Onmyoji', 'Sakura & Sword 10000 Gioks', 'Sakura & Sword 10000 Gioks', 1407000, 1406750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1368, '549', '549', 'Games Marvel Super War', 'Marvel Super War 55 Star Credits', 'Marvel Super War 55 Star Credits', 15050, 14800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1369, '550', '550', 'Games Marvel Super War', 'Marvel Super War 275 Star Credits', 'Marvel Super War 275 Star Credits', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1370, '551', '551', 'Games Marvel Super War', 'Marvel Super War 565 Star Credits', 'Marvel Super War 565 Star Credits', 145030, 144780, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1371, '552', '552', 'Games Marvel Super War', 'Marvel Super War 1155 Star Credits', 'Marvel Super War 1155 Star Credits', 290530, 290280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1372, '553', '553', 'Games Marvel Super War', 'Marvel Super War 1765 Star Credits', 'Marvel Super War 1765 Star Credits', 426330, 426080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1373, '554', '554', 'Games Marvel Super War', 'Marvel Super War 2950 Star Credits', 'Marvel Super War 2950 Star Credits', 717330, 717080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1374, '555', '555', 'Games Marvel Super War', 'Marvel Super War 6000 Star Credits', 'Marvel Super War 6000 Star Credits', 1454530, 1454280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1375, '556', '556', 'Games HAGO', 'Hago 10 Diamonds', 'Masukkan Player ID Hago Anda', 3970, 3720, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1376, '557', '557', 'Games HAGO', 'Hago 15 Diamonds', 'Masukkan Player ID Hago Anda', 5455, 5205, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1377, '558', '558', 'Games HAGO', 'Hago 20 Diamonds', 'Masukkan Player ID Hago Anda', 6940, 6690, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1378, '559', '559', 'Games HAGO', 'Hago 25 Diamonds', 'Masukkan Player ID Hago Anda', 8425, 8175, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1379, '560', '560', 'Games HAGO', 'Hago 30 Diamonds', 'Masukkan Player ID Hago Anda', 9910, 9660, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1380, '561', '561', 'Games HAGO', 'Hago 40 Diamonds', 'Masukkan Player ID Hago Anda', 12880, 12630, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1381, '562', '562', 'Games HAGO', 'Hago 45 Diamonds', 'Masukkan Player ID Hago Anda', 15490, 15240, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1382, '563', '563', 'Games HAGO', 'Hago 50 Diamonds', 'Masukkan Player ID Hago Anda', 15850, 15600, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1383, '564', '564', 'Games HAGO', 'Hago 60 Diamonds', 'Masukkan Player ID Hago Anda', 18820, 18570, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1384, '565', '565', 'Games HAGO', 'Hago 70 Diamonds', 'Masukkan Player ID Hago Anda', 21790, 21540, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1385, '566', '566', 'Games HAGO', 'Hago 80 Diamonds', 'Masukkan Player ID Hago Anda', 24490, 24240, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1386, '567', '567', 'Games HAGO', 'Hago 90 Diamonds', 'Masukkan Player ID Hago Anda', 27930, 27680, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1387, '568', '568', 'Games HAGO', 'Hago 100 Diamonds', 'Masukkan Player ID Hago Anda', 32900, 32650, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1388, '569', '569', 'Games HAGO', 'Hago 150 Diamonds', 'Masukkan Player ID Hago Anda', 48250, 48000, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1389, '570', '570', 'Games HAGO', 'Hago 200 Diamonds', 'Masukkan Player ID Hago Anda', 63100, 62850, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1390, '571', '571', 'Games HAGO', 'Hago 225 Diamonds', 'Masukkan Player ID Hago Anda', 70525, 70275, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1391, '572', '572', 'Games HAGO', 'Hago 250 Diamonds', 'Masukkan Player ID Hago Anda', 78950, 78700, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1392, '573', '573', 'Games HAGO', 'Hago 275 Diamonds', 'Masukkan Player ID Hago Anda', 85375, 85125, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1393, '574', '574', 'Games HAGO', 'Hago 375 Diamonds', 'Masukkan Player ID Hago Anda', 125050, 124800, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1394, '575', '575', 'Games HAGO', 'Hago 900 Diamonds', 'Masukkan Player ID Hago Anda', 300525, 300275, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1395, '577', '577', 'Games Valorant', 'Valorant 8150 Points', 'masukkan username akun game anda.', 805500, 805250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1396, '578', '578', 'Games Valorant', 'Valorant 4000 Points', 'masukkan username akun game anda.', 402500, 402250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1397, '579', '579', 'Games Valorant', 'Valorant 2400 Points', 'masukkan username akun game anda.', 251500, 251250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1398, '580', '580', 'Games Valorant', 'Valorant 1375 Points', 'masukkan username akun game anda.', 151500, 151250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1399, '581', '581', 'Games Valorant', 'Valorant 700 Points', 'masukkan username akun game anda.', 81500, 81250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1400, '576', '576', 'Games Valorant', 'Valorant 420 Points', 'masukkan username akun game anda.', 51500, 51250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1401, '582', '582', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 60 Diamond', '-', 15050, 14800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1402, '583', '583', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 180 Diamond', '-', 44150, 43900, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1403, '584', '584', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 300 Diamond', '-', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1404, '585', '585', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 600 Diamond', '-', 145030, 144780, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1405, '586', '586', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 1200 Diamond', '-', 290530, 290280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1406, '587', '587', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 1800 Diamond', '-', 426330, 426080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1407, '588', '588', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 3000 Diamond', '-', 717330, 717080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1408, '589', '589', 'Games Tom and Jerry : Chase', 'Tom and Jerry: Chase 6000 Diamond', '-', 1454530, 1454280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1409, '590', '590', 'Games Sausage Man', 'Sausage Man 60 Candy', 'Sausage Man 60 Candy', 16000, 15750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1410, '591', '591', 'Games Sausage Man', 'Sausage Man 180 Candy', 'Sausage Man 180 Candy', 46250, 46000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1411, '592', '592', 'Games Sausage Man', 'Sausage Man 300 Candy', 'Sausage Man 300 Candy', 73750, 73500, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP');
INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `multi`, `status`, `provider`, `tipe`, `server`) VALUES
(1412, '593', '593', 'Games Sausage Man', 'Sausage Man 680 Candy', 'Sausage Man 680 Candy', 146500, 146250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1413, '594', '594', 'Games Sausage Man', 'Sausage Man 1280 Candy', 'Sausage Man 1280 Candy', 303000, 302750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1414, '595', '595', 'Games Sausage Man', 'Sausage Man 1980 Candy', 'Sausage Man 1980 Candy', 440000, 439750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1415, '596', '596', 'Games Sausage Man', 'Sausage Man 3280 Candy', 'Sausage Man 3280 Candy', 733000, 732750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1416, '597', '597', 'Games Sausage Man', 'Sausage Man 6480 Candy', 'Sausage Man 6480 Candy', 1462500, 1462250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1417, '598', '598', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 5.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 5.000', 5475, 5225, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1418, '599', '599', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 10.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 10.000', 10405, 10155, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1419, '600', '600', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 20.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 20.000', 19500, 19250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1420, '601', '601', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 50.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 50.000', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1421, '602', '602', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 100.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 100.000', 99025, 98775, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1422, '603', '603', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 150.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 150.000', 152500, 152250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1423, '604', '604', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 300.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 300.000', 301500, 301250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1424, '605', '605', 'Voucher GOOGLE PLAY INDONESIA', 'Google Play Rp. 500.000 INDONESIA REGION', 'Google Play Gift Card Indonesia Rp. 500.000', 501500, 501250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1425, '606', '606', 'Voucher GOOGLE PLAY US REGION', 'Google Play 10$ USA REGION', '-', 174625, 174375, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1426, '607', '607', 'Voucher GOOGLE PLAY US REGION', 'Google Play 15$ USA REGION', '-', 240500, 240250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1427, '608', '608', 'Voucher GOOGLE PLAY US REGION', 'Google Play 25$ USA REGION', '-', 415500, 415250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1428, '609', '609', 'Voucher GOOGLE PLAY US REGION', 'Google Play 100$ USA REGION', '-', 1350500, 1350250, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1429, '610', '610', 'Voucher ITUNES US REGION', 'Voucher iTunes 10$', '-', 160525, 160275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1430, '611', '611', 'Voucher ITUNES US REGION', 'Voucher iTunes $15', '-', 210525, 210275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1431, '612', '612', 'Voucher ITUNES US REGION', 'Voucher iTunes $25', '-', 390525, 390275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1432, '613', '613', 'Voucher ITUNES US REGION', 'Voucher iTunes $50', '-', 770525, 770275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1433, '614', '614', 'Voucher ITUNES US REGION', 'Voucher iTunes $100', '-', 1400525, 1400275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1434, '615', '615', 'Voucher ITUNES US REGION', 'Voucher iTunes $5', '-', 90525, 90275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1435, '616', '616', 'Voucher ITUNES US REGION', 'Voucher iTunes 3 Month Membership', 'Voucher iTunes 3 Month Membership', 500525, 500275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1436, '617', '617', 'Voucher ITUNES US REGION', 'Voucher iTunes 12 Month Membership', 'Voucher iTunes 12 Month Membership', 1700525, 1700275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1437, '618', '618', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 6.000', '-', 7106, 6856, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1438, '619', '619', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 8.000', '-', 9600, 9350, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1439, '620', '620', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 12.000', '-', 14050, 13800, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1440, '621', '621', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 45.000', '-', 51025, 50775, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1441, '622', '622', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 60.000', '-', 67855, 67605, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1442, '623', '623', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 90.000', '-', 100500, 100250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1443, '624', '624', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 120.000', '-', 135185, 134935, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1444, '625', '625', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 250.000', '-', 277510, 277260, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1445, '626', '626', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 400.000', '-', 449685, 449435, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1446, '627', '627', 'Voucher Steam Wallet (IDR)', 'Steam Wallet Code Rp 600.000', '-', 674105, 673855, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1447, '628', '628', 'Voucher SPOTIFY', 'Spotify Premium Subscription Voucher - 1 Bulan', '-', 56525, 56275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1448, '629', '629', 'Voucher SPOTIFY', 'Spotify Premium Subscription Voucher - 3 Bulan', '-', 168525, 168275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1449, '630', '630', 'Voucher SPOTIFY', 'Spotify Premium Subscription Voucher - 6 Bulan', '-', 305525, 305275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1450, '632', '632', 'Voucher Unipin Voucher', 'Voucher Unipin 10.000', 'Voucher Unipin 10.000', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1451, '633', '633', 'Voucher Unipin Voucher', 'Voucher Unipin 20.000', 'Voucher Unipin 20.000', 19725, 19475, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1452, '634', '634', 'Voucher Unipin Voucher', 'Voucher Unipin 50.000', 'Voucher Unipin 50.000', 48100, 47850, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1453, '635', '635', 'Voucher Unipin Voucher', 'Voucher Unipin 100.000', 'Voucher Unipin 100.000', 95850, 95600, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1454, '636', '636', 'Voucher Unipin Voucher', 'Voucher Unipin 300.000', 'Voucher Unipin 300.000', 286000, 285750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1455, '637', '637', 'Voucher Unipin Voucher', 'Voucher Unipin 500.000', 'Voucher Unipin 500.000', 476100, 475850, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1456, '631', '631', 'Voucher Steam Wallet (USD)', 'Steam Wallet Code $50', 'Steam Wallet Code $50', 883200, 882950, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1457, '638', '638', 'Voucher Dota Auto Chess Candy (Global)', 'Voucher Dota Auto Chess 40 Candy', 'Voucher Dota Auto Chess 40 Candy', 53850, 53600, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1458, '639', '639', 'Voucher Dota Auto Chess Candy (Global)', 'Voucher Dota Auto Chess 200 Candy', 'Voucher Dota Auto Chess 200 Candy', 213900, 213650, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1459, '640', '640', 'Voucher Dota Auto Chess Candy (Global)', 'Voucher Dota Auto Chess 640 Candy', 'Voucher Dota Auto Chess 640 Candy', 534000, 533750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1460, '643', '643', 'Voucher Vidio', 'Voucher Vidio 1 Tahun Platinum', '-', 290530, 290280, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1461, '642', '642', 'Voucher Vidio', 'Voucher Vidio 30 Hari Platinum', '-', 28630, 28380, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1462, '641', '641', 'Voucher Vidio', 'Voucher Vidio 7 Hari Platinum', '-', 15050, 14800, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1463, '644', '644', 'E-Money GO PAY', 'Go Pay 10.000', 'Masukan no HP', 11150, 10900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1464, '645', '645', 'E-Money GO PAY', 'Go Pay 15.000', 'Masukan no HP', 16150, 15900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1465, '646', '646', 'E-Money GO PAY', 'Go Pay 20.000', 'Masukan no HP', 21150, 20900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1466, '647', '647', 'E-Money GO PAY', 'Go Pay 25.000', 'Masukan no HP', 26150, 25900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1467, '648', '648', 'E-Money GO PAY', 'Go Pay 30.000', 'Masukan no HP', 31150, 30900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1468, '650', '650', 'E-Money GO PAY', 'Go Pay 35.000', 'Masukan no HP', 36150, 35900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1469, '651', '651', 'E-Money GO PAY', 'Go Pay 40.000', 'Masukan no HP', 41150, 40900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1470, '652', '652', 'E-Money GO PAY', 'Go Pay 45.000', 'Masukan no HP', 46150, 45900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1471, '653', '653', 'E-Money GO PAY', 'Go Pay 50.000', 'Masukan no HP', 51150, 50900, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1472, '654', '654', 'E-Money GO PAY', 'Go Pay 55.000', 'Masukan no HP', 56195, 55945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1473, '655', '655', 'E-Money GO PAY', 'Go Pay 60.000', 'Masukkan no HP', 61175, 60925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1474, '656', '656', 'E-Money GO PAY', 'Go Pay 65.000', 'Masukkan no HP', 66195, 65945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1475, '657', '657', 'E-Money GO PAY', 'Go Pay 70.000', 'Masukan no HP', 71175, 70925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1476, '658', '658', 'E-Money GO PAY', 'Go Pay 75.000', 'Masukan no HP', 76175, 75925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1477, '659', '659', 'E-Money GO PAY', 'Go Pay 80.000', 'Masukkan no HP', 81175, 80925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1478, '660', '660', 'E-Money GO PAY', 'Go Pay 85.000', 'Masukkan no HP', 86175, 85925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1479, '661', '661', 'E-Money GO PAY', 'Go Pay 90.000', 'Masukkan no HP', 91175, 90925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1480, '662', '662', 'E-Money GO PAY', 'Go Pay 95.000', 'Masukkan no HP', 96175, 95925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1481, '663', '663', 'E-Money GO PAY', 'Go Pay 100.000', 'Masukan no HP', 101175, 100925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1482, '664', '664', 'E-Money GO PAY', 'Go Pay 150.000', 'Masukan no HP', 151195, 150945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1483, '665', '665', 'E-Money GO PAY', 'Go Pay 200.000', 'Masukan no HP', 201195, 200945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1484, '666', '666', 'E-Money GO PAY', 'Go Pay 250.000', 'Masukan no HP', 251195, 250945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1485, '667', '667', 'E-Money GO PAY', 'Go Pay 300.000', 'Masukkan no HP', 301195, 300945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1486, '668', '668', 'E-Money GO PAY', 'Go Pay 350.000', 'Masukkan no HP', 351270, 351020, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1487, '669', '669', 'E-Money GO PAY', 'Go Pay 400.000', 'Masukkan no HP', 401195, 400945, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1488, '670', '670', 'E-Money GO PAY', 'Go Pay 1.000.000', 'Masukan no HP', 1001270, 1001020, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1489, '1061', '1061', 'E-Money OVO', 'OVO 45.000', 'OVO 45.000', 46050, 45800, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1490, '1063', '1063', 'E-Money OVO', 'OVO 50.000', 'OVO 50.000', 49775, 49525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1491, '1066', '1066', 'E-Money OVO', 'OVO 60.000', 'OVO 60.000', 59775, 59525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1492, '1070', '1070', 'E-Money OVO', 'OVO 70.000', 'OVO 70.000', 69775, 69525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1493, '1075', '1075', 'E-Money OVO', 'OVO 85.000', 'OVO 85.000', 86050, 85800, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1494, '1077', '1077', 'E-Money OVO', 'OVO 95.000', 'OVO 95.000', 96050, 95800, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1495, '1078', '1078', 'E-Money OVO', 'OVO 100.000', 'OVO 100.000', 99775, 99525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1496, '1079', '1079', 'E-Money OVO', 'OVO 125.000', 'OVO 125.000', 126250, 126000, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1497, '671', '671', 'E-Money OVO', 'OVO 150.000', 'OVO 150.000', 149775, 149525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1498, '672', '672', 'E-Money OVO', 'OVO 175.000', 'OVO 175.000', 176250, 176000, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1499, '6734', '6734', 'E-Money OVO', 'OVO 200.000', 'OVO 200.000', 199775, 199525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1500, '674', '674', 'E-Money OVO', 'OVO 600.000', 'OVO 600.000', 600175, 599925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1501, '675', '675', 'E-Money OVO', 'OVO 800.000', 'OVO 800.000', 800175, 799925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1502, '676', '676', 'E-Money OVO', 'OVO 1.000.000', 'OVO 1.000.000', 1000175, 999925, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1503, '677', '677', 'E-Money DANA', 'DANA 10.000', '-', 10625, 10375, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1504, '678', '678', 'E-Money DANA', 'DANA 15.000', '-', 15530, 15280, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1505, '679', '679', 'E-Money DANA', 'DANA 25.000', '-', 25530, 25280, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1506, '680', '680', 'E-Money DANA', 'DANA 30.000', '-', 30540, 30290, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1507, '681', '681', 'E-Money DANA', 'DANA 40.000', '-', 40540, 40290, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1508, '682', '682', 'E-Money DANA', 'DANA 50.000', '-', 50540, 50290, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1509, '683', '683', 'E-Money DANA', 'DANA 90.000', '-', 90625, 90375, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1510, '684', '684', 'E-Money DANA', 'DANA 95.000', '--', 95625, 95375, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1511, '687', '687', 'E-Money DANA', 'DANA 600.000', '-', 600700, 600450, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1512, '686', '686', 'E-Money DANA', 'DANA 500.000', '-', 500540, 500290, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1513, '685', '685', 'E-Money DANA', 'DANA 400.000', '-', 400570, 400320, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1514, '688', '688', 'E-Money DANA', 'DANA 800.000', '-', 800700, 800450, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1515, '689', '689', 'E-Money DANA', 'DANA 900.000', '-', 900700, 900450, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1516, '690', '690', 'E-Money DANA', 'DANA 1.000.000', '-', 1000540, 1000290, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1517, '691', '691', 'E-Money TIX ID', 'TIX ID 10.000', '-', 11435, 11185, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1518, '692', '692', 'E-Money TIX ID', 'TIX ID 25.000', '-', 26450, 26200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1519, '693', '693', 'E-Money TIX ID', 'TIX ID 50.000', '-', 51450, 51200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1520, '694', '694', 'E-Money TIX ID', 'TIX ID 100.000', '-', 101450, 101200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1521, '695', '695', 'E-Money TIX ID', 'TIX ID 200.000', '-', 201450, 201200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1522, '696', '696', 'E-Money TIX ID', 'TIX ID 300.000', '-', 301450, 301200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1523, '697', '697', 'E-Money TIX ID', 'TIX ID 400.000', '-', 401450, 401200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1524, '698', '698', 'E-Money TIX ID', 'TIX ID 500.000', '-', 501450, 501200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1525, '699', '699', 'E-Money TIX ID', 'TIX ID 600.000', '-', 601450, 601200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1526, '700', '700', 'E-Money TIX ID', 'TIX ID 700.000', '-', 701450, 701200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1527, '701', '701', 'E-Money TIX ID', 'TIX ID 800.000', '-', 801450, 801200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1528, '702', '702', 'E-Money TIX ID', 'TIX ID 900.000', '-', 901450, 901200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1529, '703', '703', 'E-Money TIX ID', 'TIX ID 1.000.000', '-', 1001450, 1001200, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1530, '704', '704', 'E-Money LinkAja', 'LinkAja Rp 15.000', '-', 15530, 15280, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1531, '705', '705', 'E-Money LinkAja', 'LinkAja Rp 20.000', '-', 20530, 20280, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1532, '706', '706', 'E-Money LinkAja', 'LinkAja Rp 25.000', '-', 25530, 25280, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1533, '707', '707', 'E-Money LinkAja', 'LinkAja Rp 30.000', '-', 30575, 30325, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1534, '708', '708', 'E-Money LinkAja', 'LinkAja Rp 35.000', '-', 35675, 35425, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1535, '709', '709', 'E-Money LinkAja', 'LinkAja Rp 40.000', '-', 40550, 40300, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1536, '710', '710', 'E-Money LinkAja', 'LinkAja Rp 45.000', '-', 45675, 45425, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1537, '711', '711', 'E-Money LinkAja', 'LinkAja Rp 50.000', '-', 50535, 50285, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1538, '712', '712', 'E-Money SHOPEE PAY', 'SHOPEE PAY 20.000', 'SHOPEE PAY 20.000', 20725, 20475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1539, '713', '713', 'E-Money SHOPEE PAY', 'SHOPEE PAY 25.000', 'SHOPEE PAY 25.000', 25725, 25475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1540, '714', '714', 'E-Money SHOPEE PAY', 'SHOPEE PAY 30.000', 'SHOPEE PAY 30.000', 30725, 30475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1541, '715', '715', 'E-Money SHOPEE PAY', 'SHOPEE PAY 40.000', 'SHOPEE PAY 40.000', 40725, 40475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1542, '716', '716', 'E-Money SHOPEE PAY', 'SHOPEE PAY 50.000', 'SHOPEE PAY 50.000', 50725, 50475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1543, '717', '717', 'E-Money SHOPEE PAY', 'SHOPEE PAY 60.000', 'SHOPEE PAY 60.000', 60725, 60475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1544, '718', '718', 'E-Money SHOPEE PAY', 'SHOPEE PAY 70.000', 'SHOPEE PAY 70.000', 70725, 70475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1545, '719', '719', 'E-Money SHOPEE PAY', 'SHOPEE PAY 75.000', 'SHOPEE PAY 75.000', 75725, 75475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1546, '720', '720', 'E-Money SHOPEE PAY', 'SHOPEE PAY 80.000', 'SHOPEE PAY 80.000', 80725, 80475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1547, '721', '721', 'E-Money SHOPEE PAY', 'SHOPEE PAY 90.000', 'SHOPEE PAY 90.000', 90725, 90475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1548, '722', '722', 'E-Money SHOPEE PAY', 'SHOPEE PAY 100.000', 'SHOPEE PAY 100.000', 100725, 100475, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1549, '723', '723', 'E-Money SHOPEE PAY', 'SHOPEE PAY 150.000', 'SHOPEE PAY 150.000', 150820, 150570, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1550, '724', '724', 'E-Money SHOPEE PAY', 'SHOPEE PAY 200.000', 'SHOPEE PAY 200.000', 200820, 200570, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1551, '725', '725', 'E-Money SHOPEE PAY', 'SHOPEE PAY 250.000', 'SHOPEE PAY 250.000', 250820, 250570, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1552, '726', '726', 'E-Money SHOPEE PAY', 'SHOPEE PAY 300.000', 'SHOPEE PAY 300.000', 300825, 300575, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1553, '727', '727', 'E-Money SHOPEE PAY', 'SHOPEE PAY 400.000', 'SHOPEE PAY 400.000', 400820, 400570, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1554, '728', '728', 'E-Money SHOPEE PAY', 'SHOPEE PAY 500.000', 'SHOPEE PAY 500.000', 500820, 500570, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1555, '729', '729', 'E-Money SHOPEE PAY', 'SHOPEE PAY 600.000', 'SHOPEE PAY 600.000', 600800, 600550, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1556, '730', '730', 'E-Money SHOPEE PAY', 'SHOPEE PAY 700.000', 'SHOPEE PAY 700.000', 700800, 700550, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1557, '731', '731', 'E-Money SHOPEE PAY', 'SHOPEE PAY 800.000', 'SHOPEE PAY 800.000', 800775, 800525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1558, '732', '732', 'E-Money SHOPEE PAY', 'SHOPEE PAY 900.000', 'SHOPEE PAY 900.000', 900775, 900525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1559, '733', '733', 'E-Money SHOPEE PAY', 'SHOPEE PAY 1.000.000', 'SHOPEE PAY 1.000.000', 1000800, 1000550, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1560, '742', '742', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 5.000', 'Telepon 80 menit sesama, 20 menit semua op 1 Hari (sesuai zona)', 5605, 5355, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1561, '743', '743', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 10.000', 'Telepon 185 menit sesama, 15 menit semua operator 1 Hari (sesuai zona)', 7025, 6775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1562, '744', '744', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 20.000', 'Telepon 370 menit sesama, 30 menit semua op 3 Hari (sesuai zona)', 13025, 12775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1563, '745', '745', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 25.000', 'Telepon 550 menit sesama, 50 menit semua op 7 Hari (sesuai zona)', 20740, 20490, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1564, '746', '746', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 50.000', 'Telepon 1200 menit sesama, 100 menit semua op 15 Hari (sesuai zona)', 38025, 37775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1565, '747', '747', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 80.000', 'Telepon 2000 menit sesama, 100 menit semua op 30 Hari (sesuai zona)', 51025, 50775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1566, '748', '748', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 100.000', 'Telepon 2250 menit sesama, 250 menit semua op 30 Hari (sesuai zona)', 100650, 100400, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1567, '749', '749', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 130.000', 'Telepon 6250 menit sesama, 250 menit semua op 30 Hari (sesuai zona)', 106025, 105775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1568, '750', '750', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 130.000', 'Telepon 6250 menit sesama, 250 menit semua op 30 Hari (sesuai zona)', 100525, 100275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1569, '751', '751', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 5 Menit Sesama / 1 Hari', 'Telepon Sesama Tsel (5 menit, 1 Hari)', 1735, 1485, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1570, '752', '752', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 25 Menit Sesama / 1 Hari', 'Telepon Sesama Tsel (25 menit, 1 Hari)', 4265, 4015, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1571, '753', '753', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 50 Menit Sesama / 3 Hari', 'Telepon Sesama Tsel (50 menit, 3Hari) (sesuai zona)', 12500, 12250, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1572, '754', '754', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 50 Menit Sesama / 7 Hari', 'Telepon Sesama Tsel (50 menit, 7Hari) (sesuai zona)', 21930, 21680, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1573, '755', '755', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 200 Menit Sesama / 30 Hari', 'Telepon Sesama Tsel (200 menit, 30Hari) (sesuai zona)', 120500, 120250, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1574, '756', '756', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 1700 menit On Net / 7 Hari', 'manfaat sesuai zona', 40025, 39775, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1575, '757', '757', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 9000 menit On Net / 30 Hari', 'Manfaat sesuai zona', 99500, 99250, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1576, '758', '758', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 170 Menit Sesama + 30 Menit Semua Op / 3 Hari', 'Telepon 170 menit sesama, 30 menit semua op 3 Hari (sesuai zona)', 10660, 10410, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1577, '759', '759', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 350 Menit Sesama + 50 Menit Semua Op / 7 Hari', 'Telepon 350 menit sesama, 50 menit semua op 7 Hari (sesuai zona)', 20560, 20310, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1578, '760', '760', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel Telepon 1000 menit sesama, 100 menit semua op / 30 Hari', 'Telepon 1000 menit sesama, 100 menit semua op (30 Hari) (manfaat sesuai zona)', 50500, 50250, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1579, '793', '793', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel (350 menit tsel + 50 menit all opr + 200SMS) / 7 Hari', 'manfaat sesuai zona', 25770, 25520, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1580, '734', '734', 'Paket SMS Telpon TELKOMSEL', 'Telepon Semua Op (20 menit, 1Hari)', 'Paket TELEPON - Telepon Semua Op (20 menit, 1Hari)', 5605, 5355, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1581, '735', '735', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel SMS 5.000', '75-250 SMS ke semua op 1 hari (sesuai zona)', 5575, 5325, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1582, '736', '736', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel SMS 10.000', '500 SMS ke semua op 7 hari (sesuai zona)', 11250, 11000, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1583, '737', '737', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel 1000 SMS Semua Op / 15 Hari', 'Telkomsel 1000 SMS ke semua op 15 hari', 16100, 15850, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1584, '738', '738', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel SMS 20.000', '1500 SMS ke semua op 30 hari (sesuai zona)', 20600, 20350, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1585, '739', '739', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel 2000 SMS Semua Op / 30 Hari', 'Telkomsel 2000 SMS ke semua op 30 hari', 26100, 25850, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1586, '740', '740', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel 10 SMS Sesama Telkomsel / 1 Hari', '-', 1125, 875, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1587, '741', '741', 'Paket SMS Telpon TELKOMSEL', 'Telkomsel 20 SMS Sesama Telkomsel / 1 Hari', '-', 1725, 1475, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1588, '762', '762', 'Paket SMS Telpon INDOSAT', 'Indosat Telepon 1000 Menit Sesama / 1 Hari', '-', 2600, 2350, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1589, '763', '763', 'Paket SMS Telpon INDOSAT', 'Indosat Telepon 300 Menit Sesama / 7 Hari', '-', 15010, 14760, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1590, '764', '764', 'Paket SMS Telpon INDOSAT', 'Indosat 300 SMS Sesama + 100 SMS Operator Lain', '300 SMS sesama Indosat + 100 SMS operator lain', 6650, 6400, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1591, '765', '765', 'Paket SMS Telpon INDOSAT', 'Indosat 600 SMS Sesama + 200 SMS Operator Lain', '600 SMS sesama Isat + 200 SMS operator lain', 12200, 11950, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1592, '766', '766', 'Paket SMS Telpon INDOSAT', 'Indosat 1250 SMS Sesama + 250 SMS Operator Lain / 30 Hari', '1250 SMS sesama Isat + 250 SMS operator lain 30 hari', 10400, 10150, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1593, '767', '767', 'Paket SMS Telpon INDOSAT', 'Indosat 2000 SMS Sesama + 500 SMS Operator Lain', '2000 SMS sesama Isat + 500 SMS operator lain', 28150, 27900, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1594, '768', '768', 'Paket SMS Telpon TRI', 'Tri Telepon 20 Menit Ke Semua Op 7 Hari', '-', 5395, 5145, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1595, '769', '769', 'Paket SMS Telpon TRI', 'Tri Telepon 60 Menit Ke Semua Operator 30 Hari', '-', 15200, 14950, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1596, '770', '770', 'Paket SMS Telpon TRI', 'Tri Telepon 150 Menit Ke Semua Op 30 Hari', '-', 29850, 29600, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1597, '771', '771', 'Paket SMS Telpon TRI', 'Tri Nelpon++ 10.000', '120 Menit nelpon ke sesama tri, masa aktif mengikuti masa aktif kartu', 10545, 10295, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1598, '772', '772', 'Paket SMS Telpon TRI', 'Tri Nelpon++ 14.000', '20 Menit nelpon ke semua operator, masa aktif mengikuti masa aktif kartu', 14500, 14250, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1599, '773', '773', 'Paket SMS Telpon TRI', 'Tri Nelpon++ 40.000', '65 Menit nelpon ke semua operator, masa aktif mengikuti masa aktif kartu', 40425, 40175, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1600, '774', '774', 'Paket SMS Telpon TRI', 'Tri Telepon 250 Menit Ke Semua Op 30 Hari', '-', 49475, 49225, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1601, '775', '775', 'Paket SMS Telpon TRI', 'Tri Mania 375 Menit 7 Hari', 'Nelpon sesama tri 375 menit 7 hari.', 12400, 12150, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1602, '776', '776', 'Paket SMS Telpon TRI', 'Tri Mania 800 Menit 30 Hari', 'Nelpon sesama tri 800 menit 30 hari.', 24960, 24710, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1603, '777', '777', 'Paket SMS Telpon TRI', 'Tri 250 SMS ALL Operator Sampai  Masa Aktif Kartu', '-', 10800, 10550, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1604, '778', '778', 'Paket SMS Telpon TRI', 'Tri 250 SMS ALL Operator 7 Hari', 'Tri 250 SMS ALL Operator 7 Hari', 6175, 5925, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1605, '779', '779', 'Paket SMS Telpon TRI', 'Tri 600 SMS ALL Operator 14 Hari', 'Tri 600 SMS ALL Operator 14 Hari', 11110, 10860, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1606, '780', '780', 'Paket SMS Telpon XL', 'AnyNet 300 Menit 90 Hari', 'Bebas telepon ke semua operator selamat 300 Menit. Masa aktif 90 Hari.', 96525, 96275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1607, '781', '781', 'Paket SMS Telpon XL', 'AnyNet 325 Menit 30 Hari', 'Bebas telepon ke semua operator selamat 325 Menit. Masa aktif 30 Hari.', 70215, 69965, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1608, '782', '782', 'Paket SMS Telpon XL', 'AnyNet 500 Menit 90 Hari', 'Bebas telepon ke semua operator selamat 500 Menit. Masa aktif 90 Hari.', 134555, 134305, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1609, '783', '783', 'Paket SMS Telpon XL', 'XL Nelpon Sesama 14.000', 'Nelpon ke nomor XL 200 menit, berlaku 14 Hari', 14810, 14560, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1610, '784', '784', 'Paket SMS Telpon XL', 'XL Nelpon Sesama 35.000', 'Nelpon ke nomor XL 500 menit, berlaku 30 Hari', 34525, 34275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1611, '785', '785', 'Paket SMS Telpon XL', 'XL Nelpon Semua Operator 12.000', 'Bebas telepon ke semua operator selamat 400 Menit (370 Menit ke XL + 30 Menit ke Operator Lain). Masa aktif 7 Hari.', 12210, 11960, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1612, '786', '786', 'Paket SMS Telpon XL', 'XL Nelpon Semua Operator 40.000', 'Bebas telepon ke semua operator selama 150 Menit. Masa aktif 30 Hari.', 38725, 38475, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1613, '787', '787', 'Paket SMS Telpon XL', 'XL Nelpon Semua Operator 60.000', 'Bebas telepon ke semua operator selama 250 Menit. Masa aktif 30 Hari.', 57500, 57250, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1614, '788', '788', 'Paket SMS Telpon XL', 'XL Nelpon Semua Operator 140.000', 'Bebas telepon ke semua operator selama 500 Menit. Masa aktif 30 Hari.', 131525, 131275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1615, '789', '789', 'Paket SMS Telpon XL', 'XL XTRA Bicara 30.000 / 30 Hari', 'Nelpon ke nomor XL tanpa batas, Nelpon ke operator lain 30 menit, Internet semua jaringan 200 MB, 30 Hari', 30525, 30275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1616, '790', '790', 'Paket SMS Telpon XL', 'XL XTRA Bicara 35.000 / 30 Hari', 'Nelpon dan sms ke nomor XL tanpa batas, Nelpon ke operator lain 30 menit, 30 sms ke semua operator, Internet semua jaringan 200 MB, 30 Hari', 35525, 35275, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1617, '791', '791', 'Paket SMS Telpon XL', 'XL Nelpon & SMS 35.000', 'nelpon ke nomor xl 200 menit, sms ke semua operator 400 sms, berlaku 30 Hari', 32875, 32625, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1618, '792', '792', 'Paket SMS Telpon XL', 'XL Nelpon Sesama 350 Menit + Operator Lain 50 Menit / 7 Hari', '-', 10710, 10460, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(1619, '796', '796', 'TV ORANGE TV', 'Orange TV 50.000', '-', 47100, 46850, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1620, '797', '797', 'TV ORANGE TV', 'Orange TV 80.000', '-', 74600, 74350, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1621, '798', '798', 'TV ORANGE TV', 'Orange TV 100.000', '-', 93600, 93350, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1622, '799', '799', 'TV ORANGE TV', 'Orange TV 300.000', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1623, '800', '800', 'TV k-vision', 'K-VISION PAKET SPORTS2 (ONS2) 30 Hari', 'Olimpiade Tokyo - Live di Champions TV 1, 2 & 3 (23 July - 08 August)', 43620, 43370, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1624, '801', '801', 'TV k-vision', 'K-VISION PAKET JUARA (J01) 30 Hari', 'All Channel :Olahraga, Hiburan, Cartoon, Musik, Film, Ilmu Pengetahuan, Gaya Hidup, Channel Lokal, dll', 158900, 158650, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1625, '802', '802', 'TV Decoder GOL', 'DECODER GOL PAKET SPORTS2 (ONS2) 30 Hari', 'Olimpiade Tokyo - Live di Champions TV 1, 2 & 3 (23 July - 08 August)', 43620, 43370, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1626, '803', '803', 'TV Decoder GOL', 'DECODER GOL PAKET GIBOL (GB07)', '2 Channel ( Liga1, Liga2) & TV Lokal', 9500, 9250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1627, '805', '805', 'TV Transvision', 'Samsung HD Paket Jepang / 1 Bulan', 'ANIMAX, ANIPLUS, WAKU WAKU JAPAN', 14000, 13750, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1628, '804', '804', 'TV Transvision', 'Samsung HD Paket Golf / 1 Bulan', 'GOLF CHANNEL', 44500, 44250, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1629, '806', '806', 'TV Transvision', 'Samsung HD Paket Anak Hebat / 1 Bulan', 'Disney channel,Cartoon netw,Boomerang, Disney Jr, Nickelodeon, Nick Jr', 26900, 26650, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1630, '807', '807', 'TV Transvision', 'Samsung HD Paket Anak / 1 Bulan', 'Disney channel Hd, Nickelodeon', 18100, 17850, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1631, '808', '808', 'TV Transvision', 'Samsung HD Paket Cartoon / 1 Bulan', 'Cartoon network Hd, Boomerang', 9500, 9250, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1632, '809', '809', 'TV Transvision', 'Samsung HD Paket Sport / 1 Bulan', 'Fox sport Hd 1,2 dan 3, Fight sport', 45500, 45250, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1633, '810', '810', 'TV Transvision', 'Samsung HD Paket Barat / 1 Bulan', 'Fox Hd, Fox life Hd, Fox crime Hd, Blu ant Enterainment Hd', 27500, 27250, 'Tidak', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(1634, '824', '824', 'Pulsa Internasional CHINA TOPUP', 'China 30', 'China 30', 100500, 100250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1635, '825', '825', 'Pulsa Internasional CHINA TOPUP', 'China 50', 'China 50', 150500, 150250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1636, '826', '826', 'Pulsa Internasional CHINA TOPUP', 'China 100', 'China 100', 300500, 300250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1637, '827', '827', 'Pulsa Internasional MAXIS', 'Maxis 5', 'Maxis 5', 20375, 20125, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1638, '828', '828', 'Pulsa Internasional MAXIS', 'Maxis 10', 'Maxis 10', 40250, 40000, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1639, '829', '829', 'Pulsa Internasional MAXIS', 'Maxis 20', 'Maxis 20', 80000, 79750, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1640, '830', '830', 'Pulsa Internasional SMART PINOY', 'SMART PINOY 4', 'SMART PINOY 4', 41450, 41200, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1641, '831', '831', 'Pulsa Internasional SMART PINOY', 'SMART PINOY 5', 'SMART PINOY 5', 51688, 51438, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1642, '832', '832', 'Pulsa Internasional SMART PINOY', 'SMART PINOY 8', 'SMART PINOY 8', 82400, 82150, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1643, '833', '833', 'Pulsa Internasional SMART PINOY', 'SMART PINOY 12', 'SMART PINOY 12', 123350, 123100, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1644, '834', '834', 'Pulsa Internasional SINGTEL', 'Singtel 5', 'Singtel 5', 51688, 51438, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1645, '835', '835', 'Pulsa Internasional SINGTEL', 'Singtel 10', 'Singtel 10', 102875, 102625, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1646, '836', '836', 'Pulsa Internasional SINGTEL', 'Singtel 15', 'Singtel 15', 154063, 153813, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1647, '837', '837', 'Pulsa Internasional THAILAND TOPUP', 'Thailand Topup 50', 'Thailand Topup 50', 30500, 30250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1648, '838', '838', 'Pulsa Internasional THAILAND TOPUP', 'Thailand Topup 100', 'Thailand Topup 100', 60500, 60250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1649, '839', '839', 'Pulsa Internasional THAILAND TOPUP', 'Thailand Topup 200', 'Thailand Topup 200', 120500, 120250, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa Internasional', 'TOP UP'),
(1650, '1450', '1450', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 2.5 GB / 7 Hari', '2,5GB FLASH, 7 HARI. perhatikan zona dan regional.', 17510, 17260, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1651, '1451', '1451', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 3 GB / 7 Hari', '3 GB, 7 Hari. perhatikan zona dan regional.', 18000, 17750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1652, '1452', '1452', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 3.5 GB / 7 Hari', '3,5GB FLASH, 7 HARI. perhatikan zona dan regional.', 17410, 17160, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1653, '1453', '1453', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 1 GB + 500 MB Youtube / 30 Hari', '1 GB Flash + 500 MB Youtube / 30 Hari', 24500, 24250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1654, '1454', '1454', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 2.5 GB + 1 GB Youtube / 30 Hari', '2.5 GB Flash + 1 GB Youtube / 30 Hari', 50000, 49750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1655, '1455', '1455', 'Voucher TELKOMSEL', 'Voucher Telkomsel Data 4 GB + 2 GB Youtube / 30 Hari', '4 GB Flash + 2 GB Youtube / 30 Hari', 76000, 75750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1656, '1004', '1004', 'Voucher AXIS', 'Voucher AIGO 1 GB / 30 Hari', '1 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari', 13305, 13055, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1657, '1005', '1005', 'Voucher AXIS', 'Voucher AIGO 2 GB / 30 Hari', '2 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 22505, 22255, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1658, '1006', '1006', 'Voucher AXIS', 'Voucher AIGO 3 GB / 30 Hari', '3 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 28320, 28070, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1659, '1007', '1007', 'Voucher AXIS', 'Voucher AIGO 5 GB / 30 Hari', '5 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 42170, 41920, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1660, '1008', '1008', 'Voucher AXIS', 'Voucher AIGO 8 GB / 30 Hari', '8 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 56570, 56320, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1661, '1009', '1009', 'Voucher AXIS', 'Voucher AIGO 12 GB / 30 Hari', '12 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 68145, 67895, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1662, '1010', '1010', 'Voucher AXIS', 'Voucher AIGO 15 GB / 30 Hari', '15 GB All Jaringan Berlaku 24 Jam Masa Aktif 30 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 78087, 77837, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1663, '1011', '1011', 'Voucher AXIS', 'Voucher AIGO 25 GB / 60 Hari', '25 GB All Jaringan Berlaku 24 Jam Masa Aktif 60 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 87370, 87120, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1664, '1012', '1012', 'Voucher AXIS', 'Voucher AIGO 50 GB / 60 Hari', '50 GB All Jaringan Berlaku 24 Jam Masa Aktif 60 Hari. Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 136070, 135820, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1665, '1013', '1013', 'Voucher AXIS', 'Voucher AIGO MINI 1 GB / 5 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 8100, 7850, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1666, '1014', '1014', 'Voucher AXIS', 'Voucher AIGO MINI 2 GB / 7 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 14855, 14605, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1667, '1015', '1015', 'Voucher AXIS', 'Voucher AIGO MINI 3 GB / 15 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 19405, 19155, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1668, '1016', '1016', 'Voucher AXIS', 'Voucher AIGO MINI 5 GB / 15 Hari', 'Setelah mendapat SN, ketik *838*kodevoucher# untuk mengaktifkan paket', 30720, 30470, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1669, '1017', '1017', 'Voucher SMART', 'Voucher Smartfren Data 10.000', 'Voucher 1.25 GB 24 jam, 1.75 GB malam, 1 GB Chat, 7 Hari', 12000, 11750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1670, '1018', '1018', 'Voucher SMART', 'Voucher Smartfren Data 30.000', 'Voucher 5 GB 24 jam, 5 GB malam, 30 Hari', 34070, 33820, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1671, '1019', '1019', 'Voucher SMART', 'Voucher Smartfren Data 40.000', 'Voucher 8 GB 24 jam, 8 GB malam, 30 Hari', 44500, 44250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1672, '1020', '1020', 'Voucher SMART', 'Voucher Smartfren Data 60.000', 'Voucher 15 GB 24 jam, 15 GB malam, 30 Hari', 65500, 65250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1673, '1021', '1021', 'Voucher SMART', 'Voucher Smartfren Data 100.000', 'Voucher 30 GB 24 jam, 30 GB malam, 30 Hari', 98570, 98320, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1674, '1022', '1022', 'Voucher TRI', 'Voucher Tri 1 GB + 500 MB All Net / 30 Hari', 'Claim Voucher dengan cara *111*SN#', 13950, 13700, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1675, '1023', '1023', 'Voucher TRI', 'Voucher Tri 1,5 GB + 500 MB All Net / 30 Hari', 'Claim Voucher dengan cara *111*SN#', 18500, 18250, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1676, '1024', '1024', 'Voucher TRI', 'Voucher Tri 2 GB + 1 GB All Net / 30 Hari', 'Claim Voucher dengan cara *111*SN#', 24600, 24350, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1677, '1025', '1025', 'Voucher TRI', 'Voucher Tri 5 GB + 1 GB All Net / 30 Hari', 'Claim Voucher dengan cara *111*SN#', 35500, 35250, 'Tidak', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1678, '1026', '1026', 'Voucher TRI', 'Voucher Tri AMI 4 GB / 7 Hari', 'Voucher Three 4GB 30 Hari + Unlimited Youtube 7 Hari', 40000, 39750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1679, '857', '857', 'Data TRI', 'Tri Data Mini 5 GB / 7 Hari', '2.5 GB Nasional, 2.5 GB (01.00 - 09.00), 7 Hari', 16000, 15750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1680, '858', '858', 'Pulsa TELKOMSEL', 'Telkomsel 75.000', 'Pulsa Telkomsel Rp 75.000', 73445, 73195, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1681, '862', '862', 'Pulsa TELKOMSEL', 'Telkomsel 4.000', 'Pulsa Telkomsel Rp 4.000', 5260, 5010, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1682, '861', '861', 'Pulsa TELKOMSEL', 'Telkomsel 3.000', 'Pulsa Telkomsel Rp 3.000', 4260, 4010, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1683, '860', '860', 'Pulsa TELKOMSEL', 'Telkomsel 2.000', 'Pulsa Telkomsel Rp 2.000', 3260, 3010, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1684, '859', '859', 'Pulsa TELKOMSEL', 'Telkomsel 1.000', 'Pulsa Telkomsel Rp 1.000', 2050, 1800, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1685, '864', '864', 'Pulsa TELKOMSEL', 'Telkomsel 45.000', 'Pulsa Telkomsel Rp 45.000', 45345, 45095, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1686, '865', '865', 'Pulsa TELKOMSEL', 'Telkomsel 55.000', 'Pulsa Telkomsel Rp 55.000', 55320, 55070, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1687, '866', '866', 'Pulsa TELKOMSEL', 'Telkomsel 65.000', 'Pulsa Telkomsel Rp 65.000', 65270, 65020, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1688, '867', '867', 'Pulsa TELKOMSEL', 'Telkomsel 85.000', 'Pulsa Telkomsel Rp 85.000', 85145, 84895, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1689, '868', '868', 'Pulsa TELKOMSEL', 'Telkomsel 95.000', 'Pulsa Telkomsel Rp 95.000', 95070, 94820, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1690, '869', '869', 'Pulsa TELKOMSEL', 'Telkomsel 35.000', 'Pulsa Telkomsel Rp 35.000', 35425, 35175, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1691, '871', '871', 'Pulsa TRI', 'Three 1.000', 'Pulsa Three Rp 1.000', 1671, 1421, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1692, '872', '872', 'Pulsa TRI', 'Three 2.000', 'Pulsa Three Rp 2.000', 2843, 2593, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1693, '873', '873', 'Pulsa TRI', 'Three 3.000', 'Pulsa Three Rp 3.000', 3615, 3365, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1694, '874', '874', 'Pulsa TRI', 'Three 4.000', 'Pulsa Three Rp 4.000', 4638, 4388, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1695, '875', '875', 'Pulsa TRI', 'Three 7.000', 'Pulsa Three Rp 7.000', 7758, 7508, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1696, '876', '876', 'Pulsa TRI', 'Three 8.000', 'Pulsa Three Rp 8.000', 8691, 8441, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1697, '877', '877', 'Pulsa TRI', 'Three 75.000', 'Pulsa Three Rp 75.000', 73240, 72990, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1698, '878', '878', 'Pulsa TRI', 'Three 80.000', 'Pulsa Three Rp 80.000', 76625, 76375, 'Tidak', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1699, '879', '879', 'Pulsa by.U', 'by.U 5.000', 'pulsa by.U Rp 5.000', 6025, 5775, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1700, '880', '880', 'Pulsa by.U', 'by.U 10.000', 'pulsa by.U Rp 10.000', 10855, 10605, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1701, '881', '881', 'Pulsa by.U', 'by.U 15.000', 'pulsa by.U Rp 15.000', 15530, 15280, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1702, '882', '882', 'Pulsa by.U', 'by.U 20.000', 'pulsa by.U Rp 20.000', 20600, 20350, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1703, '883', '883', 'Pulsa by.U', 'by.U 25.000', 'pulsa by.U Rp 25.000', 25510, 25260, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1704, '884', '884', 'Pulsa by.U', 'by.U 50.000', 'pulsa by.U Rp 50.000', 50650, 50400, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1705, '885', '885', 'Pulsa by.U', 'by.U 100.000', 'pulsa by.U Rp 100.000', 100650, 100400, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1706, '886', '886', 'Pulsa by.U', 'by.U 150.000', 'pulsa by.U Rp 150.000', 150725, 150475, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1707, '887', '887', 'Pulsa by.U', 'by.U 200.000', 'pulsa by.U Rp 200.000', 200725, 200475, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(1708, '888', '888', 'Data TELKOMSEL', 'Telkomsel Data Mini 1 GB / 1 Hari', '-', 10875, 10625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1709, '889', '889', 'Data TELKOMSEL', 'Telkomsel Data Mini 1 GB / 3 Hari', '24 jam', 12950, 12700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1710, '890', '890', 'Data TELKOMSEL', 'Telkomsel Data Mini 2 GB / 3 Hari', '24 jam', 16000, 15750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1711, '891', '891', 'Data TELKOMSEL', 'Telkomsel Data Mini 5 GB / 3 Hari', '-', 29050, 28800, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP');
INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `multi`, `status`, `provider`, `tipe`, `server`) VALUES
(1712, '892', '892', 'Data TELKOMSEL', 'Telkomsel Data Mini 10 GB / 3 Hari', '24 jam', 37125, 36875, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1713, '893', '893', 'Data TELKOMSEL', 'Telkomsel Data Mini 1 GB / 7 Hari', '-', 20975, 20725, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1714, '894', '894', 'Data TELKOMSEL', 'Telkomsel Data Mini 5 GB / 7 Hari', '24 jam', 37600, 37350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1715, '895', '895', 'Data TELKOMSEL', 'Telkomsel Data Mini 10 GB / 7 Hari', '24 jam', 46150, 45900, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1716, '896', '896', 'Data TELKOMSEL', 'Telkomsel Data Mini 1.5 GB / 14 Hari', '-', 31075, 30825, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1717, '897', '897', 'Data TELKOMSEL', 'Telkomsel Data Mini 2 GB / 14 Hari', '-', 41075, 40825, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1718, '898', '898', 'Data TELKOMSEL', 'Telkomsel Data Malam 1 GB / 1 Hari', 'Aktif pukul 00-07', 3625, 3375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1719, '899', '899', 'Data TELKOMSEL', 'Telkomsel Data Malam 5 GB / 1 Hari', 'Aktif pukul 00-07', 6900, 6650, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1720, '900', '900', 'Data TELKOMSEL', 'Telkomsel Data Malam 5 GB / 30 Hari', 'Aktif pukul 00-07', 16800, 16550, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1721, '901', '901', 'Data TELKOMSEL', 'Telkomsel Data Malam 15 GB / 30 Hari', 'Aktif pukul 00-07', 23400, 23150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1722, '902', '902', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 1 GB / 1 Hari', '-', 6255, 6005, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1723, '903', '903', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 1 GB / 3 Hari', '-', 10875, 10625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1724, '904', '904', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 2 GB / 3 Hari', '-', 14875, 14625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1725, '905', '905', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 1 GB / 7 Hari', '-', 17625, 17375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1726, '906', '906', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 2 GB / 7 Hari', '-', 21400, 21150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1727, '907', '907', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 3 GB / 7 Hari', '-', 25400, 25150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1728, '908', '908', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 5 GB / 30 Hari', '-', 35225, 34975, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1729, '909', '909', 'Data TELKOMSEL', 'Telkomsel Paket Internet Whatsapp 10 GB / 30 Hari', '-', 53125, 52875, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1730, '910', '910', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 2 GB / 3 Hari', '-', 15005, 14755, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1731, '911', '911', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 1 GB / 7 Hari', '-', 14875, 14625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1732, '912', '912', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 2 GB / 7 Hari', '-', 22510, 22260, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1733, '913', '913', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 3 GB / 7 Hari', '-', 25375, 25125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1734, '914', '914', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 5 GB / 30 Hari', '-', 34000, 33750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1735, '915', '915', 'Data TELKOMSEL', 'Telkomsel Paket Internet Youtube 10 GB / 30 Hari', '-', 54025, 53775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1736, '916', '916', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 2 GB / 3 Hari', '-', 15010, 14760, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1737, '917', '917', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 1 GB / 7 Hari', '-', 14875, 14625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1738, '918', '918', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 2 GB / 7 Hari', '-', 21375, 21125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1739, '919', '919', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 3 GB / 7 Hari', '-', 25375, 25125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1740, '920', '920', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 5 GB / 30 Hari', '-', 33450, 33200, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1741, '921', '921', 'Data TELKOMSEL', 'Telkomsel Paket Internet Instagram 10 GB / 30 Hari', '-', 51450, 51200, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1742, '922', '922', 'Data TELKOMSEL', 'Telkomsel GamesMax 25.000', 'GamesMax 1 GB Internet + 2 GB Internet Games, berlaku 30 Hari', 23400, 23150, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1743, '923', '923', 'Data SMART', 'Smart 3 GB / 7 Hari', '1.5GB Regular + 1.5GB Malam, 7 Hari', 10405, 10155, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1744, '924', '924', 'Data SMART', 'Smart 4 GB / 14 Hari', '2GB Regular + 2GB Malam', 20360, 20110, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1745, '925', '925', 'Data SMART', 'Smart 8 GB / 14 Hari', '4GB Regular + 4GB Malam', 29500, 29250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1746, '926', '926', 'Data SMART', 'Smart 10 GB / 30 Hari', '5GB Regular + 5GB Malam', 32250, 32000, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1747, '927', '927', 'Data SMART', 'Smart 12 GB Kuota Malam / 30 Hari', 'Hanya kuota malam', 20699, 20449, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1748, '928', '928', 'Data SMART', 'Smart 16 GB / 30 Hari', '8GB Regular + 8GB Malam', 48500, 48250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1749, '929', '929', 'Data SMART', 'Smart 30 GB / 30 Hari', '15GB Regular + 15GB Malam', 56500, 56250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1750, '930', '930', 'Data SMART', 'Smart 60 GB / 30 Hari', '30 GB Regular + 30 GB Malam', 96500, 96250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1751, '931', '931', 'Data SMART', 'Smartfren Berbasis Volume 5.000', '500MB 24 jam + 1,5GB malam + 500MB chat + gratis nelpon sesama, 3 Hari', 5950, 5700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1752, '932', '932', 'Data SMART', 'Smartfren Berbasis Volume 10.000', '1,25GB 24 jam + 1,75GB malam + 1GB chat + gratis nelpon sesama, 7 Hari', 9960, 9710, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1753, '933', '933', 'Data SMART', 'Smartfren Berbasis Volume 20.000', '2GB 24 jam + 3GB malam + 1GB chat + gratis nelpon sesama, 30 Hari', 18675, 18425, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1754, '934', '934', 'Data SMART', 'Smartfren Berbasis Volume 30.000', '4GB 24 jam + 4GB malam + 2GB chat + gratis nelpon sesama, 30 Hari', 27225, 26975, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1755, '935', '935', 'Data SMART', 'Smartfren Berbasis Volume 60.000', '10GB 24 jam + 20GB malam + gratis nelpon sesama, 30 Hari', 54650, 54400, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1756, '936', '936', 'Data SMART', 'Smartfren Berbasis Volume 100.000', '20GB 24 jam + 40GB malam + gratis nelpon sesama + gratis smartmusic, 30 Hari', 91525, 91275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1757, '937', '937', 'Data SMART', 'Smartfren Berbasis Volume 150.000', '30GB 24 jam + 60GB malam + gratis nelpon sesama + gratis smartmusic, 30 HARI', 133325, 133075, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1758, '938', '938', 'Data SMART', 'Smartfren Berbasis Volume 200.000', '40GB 24 jam + 80GB malam + gratis nelpon sesama + gratis smartmusic, 30 HARI', 177025, 176775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1759, '939', '939', 'Data SMART', 'Smartfren Berbasis Volume 300.000', '45GB 24 jam + 45GB malam + 10GB bonus + gratis nelpon sesama + gratis smartmusic 30 Hari, berlaku 90 HARI', 284996, 284746, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1760, '940', '940', 'Data TRI', 'Tri Mix Small 3 GB 3 Hari', '3 GB semua jaringan 24 jam, Masa Aktif 3 Hari', 20600, 20350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1761, '941', '941', 'Data TRI', 'Tri Mix Small 3.75 GB 14 Hari', '1.75 GB (semua jaringan) + 2 GB (jaringan 4G), Masa Aktif 14 Hari', 24875, 24625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1762, '942', '942', 'Data TRI', 'Tri Mix Small 5 GB 1 Hari', '1 GB (24 jam) + 4 GB (12 malam - 9 pagi) semua jaringan, Masa Aktif 1 Hari', 5385, 5135, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1763, '943', '943', 'Data TRI', 'Tri Mix Super 10 GB 30 Hari', '2 GB (semua jaringan) + 8 GB (jaringan 4G), Masa Aktif 30 Hari', 49200, 48950, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1764, '944', '944', 'Data TRI', 'Tri Mix Super 24 GB 30 Hari', '24GB (4GB + 20GB 4G )', 88200, 87950, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1765, '945', '945', 'Data TRI', 'Tri Mix Super 30 GB 30 Hari', '30GB (8GB + 22GB 4G)', 97975, 97725, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1766, '946', '946', 'Data TRI', 'Tri Data Home 117 GB / 30 Hari', '17GB AllNet 24 jam + 40GB Weekend + 60GB Pukul 01.00-17.00 wib, masa aktif 30hr', 115525, 115275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1767, '947', '947', 'Data TRI', 'Tri Data Home 150 GB / 30 Hari', '25GB AllNet 24 jam + 55GB Weekend + 70GB Pukul 01.00-17.00 wib, masa aktif 30hr', 145525, 145275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1768, '948', '948', 'Data TRI', 'Tri Data Happy 3 GB / 3 Hari', 'Tri Data Happy 3 GB / 3 Hari', 9325, 9075, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1769, '949', '949', 'Data TRI', 'Tri Data Happy 2 GB / 5 Hari', 'Tri Data Happy 2 GB / 5 Hari', 12500, 12250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1770, '950', '950', 'Data TRI', 'Tri Data Happy 3.5 GB / 5 Hari', 'Tri Data Happy 3.5 GB / 5 Hari', 12030, 11780, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1771, '951', '951', 'Data TRI', 'Tri Data Happy 6 GB / 5 Hari', 'Tri Data Happy 6 GB / 5 Hari', 16730, 16480, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1772, '952', '952', 'Data TRI', 'Tri Data Happy 5 GB / 7 Hari', 'Tri Data Happy 5 GB / 7 Hari', 26000, 25750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1773, '953', '953', 'Data TRI', 'Tri Data Happy 9 GB / 10 Hari', 'Tri Data Happy 9 GB / 10 Hari', 27550, 27300, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1774, '954', '954', 'Data TRI', 'Tri Data Happy 12 GB / 30 Hari', 'Tri Data Happy 12 GB / 30 Hari', 47150, 46900, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1775, '955', '955', 'Data TRI', 'Tri Data Happy 18 GB / 30 Hari', 'Tri Data Happy 18 GB / 30 Hari', 65350, 65100, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1776, '956', '956', 'Data TRI', 'Tri Data Happy 25 GB / 30 Hari', 'Tri Data Happy 25 GB / 30 Hari', 88675, 88425, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1777, '957', '957', 'Data TRI', 'Tri Data Happy 52 GB / 30 Hari', '22GB utama, 30GB Unlimited akses YouTube/VIU/Netflix (FUP 1 GB/hari) setelah semua kuota regular habis (=0 MB)', 68500, 68250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1778, '958', '958', 'Data XL', 'XL Data 50 MB / 30 Hari', '50 MB, 30 Hari', 2000, 1750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1779, '959', '959', 'Data XL', 'XL Data 100 MB / 30 Hari', '100MB 30 Hari', 3305, 3055, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1780, '960', '960', 'Data XL', 'XL Data 200 MB / 30 Hari', '200 MB, 30 Hari', 4925, 4675, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1781, '961', '961', 'Data XL', 'XL Data 300 MB / 30 Hari', '300 MB, 30 Hari', 6225, 5975, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1782, '962', '962', 'Data XL', 'XL Data 400 MB / 30 Hari', '400 MB, 30 Hari', 7935, 7685, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1783, '963', '963', 'Data XL', 'XL Data 500 MB / 30 Hari', 'XL Data 500MB 30 Hari', 7495, 7245, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1784, '964', '964', 'Data XL', 'XL Data 600 MB / 30 Hari', '600 MB, 30 Hari', 10375, 10125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1785, '965', '965', 'Data XL', 'XL Data 700 MB / 30 Hari', '700 MB, 30 Hari', 12000, 11750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1786, '966', '966', 'Data XL', 'XL Data 800 MB / 30 Hari', 'XL Data 800MB 30 Hari', 9099, 8849, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1787, '967', '967', 'Data XL', 'XL Data 1 GB / 30 Hari', 'XL Data 1GB 30 Hari', 12099, 11849, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1788, '968', '968', 'Data XL', 'XL Data 1.5 GB / 30 Hari', 'XL Data 1.5 GB 30 Hari', 23499, 23249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1789, '969', '969', 'Data XL', 'XL Data 2 GB / 30 Hari', 'XL Data 2GB 30 Hari', 23645, 23395, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1790, '970', '970', 'Data XL', 'XL Data 3 GB / 30 Hari', 'XL Data 3GB 30 Hari', 36799, 36549, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1791, '971', '971', 'Data XL', 'XL Data 4 GB / 30 Hari', 'XL Data 4GB 30 Hari', 49799, 49549, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1792, '972', '972', 'Data XL', 'XL Data 5 GB / 30 Hari', 'XL Data 5GB 30 Hari', 58799, 58549, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1793, '973', '973', 'Data XL', 'XL Data 6 GB / 30 Hari', 'XL Data 6GB 30 Hari', 74050, 73800, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1794, '974', '974', 'Data XL', 'XL Data 7 GB / 30 Hari', 'XL Data 7 GB 30 Hari', 83499, 83249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1795, '975', '975', 'Data XL', 'XL Data 8 GB / 30 Hari', 'XL Data 8GB 30 Hari', 89050, 88800, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1796, '976', '976', 'Data XL', 'XL Data 9 GB / 30 Hari', 'XL Data 9 GB 30 Hari', 91499, 91249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1797, '977', '977', 'Data XL', 'XL Data 10 GB / 30 Hari', 'XL Data 10 GB 30 Hari', 94499, 94249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1798, '978', '978', 'Data XL', 'XL Data 11 GB / 30 Hari', 'XL Data 11 GB 30 Hari', 97499, 97249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1799, '979', '979', 'Data XL', 'XL Data 12 GB / 30 Hari', 'XL Data 12 GB 30 Hari', 100499, 100249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1800, '980', '980', 'Data XL', 'XL Data Mini 1 GB / 7 Hari', '1GB NASIONAL SEMUA JARINGAN, 7 HARI', 9655, 9405, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1801, '981', '981', 'Data XL', 'XL Data Mini 1.5 GB / 7 Hari', '1,5GB  FULL 24 JAM NASIONAL, 7 HARI', 9400, 9150, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1802, '982', '982', 'Data XL', 'XL Data Mini 2.5 GB / 7 Hari', '2,5GB FULL 24 JAM NASIONAL, 7 HARI', 19000, 18750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1803, '983', '983', 'Data XL', 'XL Data Mini 4 GB / 7 Hari', '4GB FULL 24 JAM NASIONAL, 7 HARI', 22500, 22250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1804, '984', '984', 'Data XL', 'XL Data Mini 6 GB / 7 Hari', '6GB FULL24 JAM  NASIONAL, 7 HARI', 25500, 25250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1805, '985', '985', 'Data XL', 'XL Xtra Combo Special 8 GB / 30 Hari', '1 GB Utama + 1 GB Youtube + 5 GB 106 kota + 4,5 GB 33 kota + 1 GB Youtube 106 kota + 5 menit semua operator', 21318, 21068, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1806, '986', '986', 'Data XL', 'XL Xtra Combo Special 14 GB / 30 Hari', '2 GB Utama + 2 GB Youtube + 8 GB 106 kota + 7 GB 33 kota + 2 GB Youtube 106 kota + 5 menit semua operator', 31483, 31233, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1807, '988', '988', 'Data XL', 'XL Xtra Combo 10 GB + 20 GB / 30 Hari', '10GB (2G/3G/4G) + Nelp Anynet 30 mins. Youtube 24 Jam 20GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 82170, 81920, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1808, '989', '989', 'Data XL', 'XL Xtra Combo 15 GB + 30 GB / 30 Hari', '15GB (2G/3G/4G) + Nelp Anynet 40 mins. Youtube 24 Jam 30GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 114085, 113835, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1809, '990', '990', 'Data XL', 'XL Xtra Combo 20 GB + 40 GB / 30 Hari', '20GB (2G/3G/4G) + Nelp Anynet 60 mins. Youtube 24 Jam 40GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 160870, 160620, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1810, '991', '991', 'Data XL', 'XL Xtra Combo 35 GB + 70 GB / 30 Hari', '35GB (2G/3G/4G) + Nelp Anynet 90 mins. Youtube 24 Jam 70GB. Youtube 01:00-06:00 Tanpa kuota Unlimited.', 217100, 216850, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1811, '992', '992', 'Data XL', 'XL Xtra Combo VIP 5 GB + 10 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 5GB + Kuota YouTube 10GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 20Menit', 62860, 62610, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1812, '993', '993', 'Data XL', 'XL Xtra Combo VIP 10 GB + 20 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 10GB + Kuota YouTube 20GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 30Menit', 89958, 89708, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1813, '994', '994', 'Data XL', 'XL Xtra Combo VIP 15 GB + 30 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 15GB + Kuota YouTube 30GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 40Menit', 122735, 122485, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1814, '995', '995', 'Data XL', 'XL Xtra Combo VIP 20 GB + 40 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 20GB + Kuota YouTube 40GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 60Menit', 168305, 168055, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1815, '996', '996', 'Data XL', 'XL Xtra Combo VIP 35 GB + 70 GB / 30 Hari', 'Kuota Utama (2G/3G/4G) 35GB + Kuota YouTube 70GB + YouTube Tanpa Kuota Tanpa Batas 01:00-06:00 WIB + Nelpon ke Semua Operator 90Menit', 222989, 222739, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1816, '1497', '1497', 'E-Money Mitra Shopee', 'Mitra Shopee 50.000', '-', 50750, 50500, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1817, '1499', '1499', 'E-Money Mitra Shopee', 'Mitra Shopee 75.000', '-', 75750, 75500, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1818, '1502', '1502', 'E-Money Mitra Shopee', 'Mitra Shopee 100.000', '-', 100750, 100500, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1819, '1503', '1503', 'E-Money Mitra Shopee', 'Mitra Shopee 150.000', '-', 150750, 150500, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1820, '1027', '1027', 'E-Money Sakuku', 'Sakuku 10.000', 'masukkan nomor hp terdaftar pada Sakuku', 10850, 10600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1821, '1028', '1028', 'E-Money Sakuku', 'Sakuku 15.000', 'masukkan nomor hp terdaftar pada Sakuku', 15810, 15560, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1822, '1029', '1029', 'E-Money Sakuku', 'Sakuku 20.000', 'masukkan nomor hp terdaftar pada Sakuku', 20850, 20600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1823, '1030', '1030', 'E-Money Sakuku', 'Sakuku 25.000', 'masukkan nomor hp terdaftar pada Sakuku', 25810, 25560, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1824, '1031', '1031', 'E-Money Sakuku', 'Sakuku 30.000', 'masukkan nomor hp terdaftar pada Sakuku', 30850, 30600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1825, '1032', '1032', 'E-Money Sakuku', 'Sakuku 35.000', 'masukkan nomor hp terdaftar pada Sakuku', 35825, 35575, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1826, '1033', '1033', 'E-Money Sakuku', 'Sakuku 40.000', 'masukkan nomor hp terdaftar pada Sakuku', 40850, 40600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1827, '1034', '1034', 'E-Money Sakuku', 'Sakuku 45.000', 'masukkan nomor hp terdaftar pada Sakuku', 45825, 45575, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1828, '1035', '1035', 'E-Money Sakuku', 'Sakuku 50.000', 'masukkan nomor hp terdaftar pada Sakuku', 50850, 50600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1829, '1036', '1036', 'E-Money Sakuku', 'Sakuku 55.000', 'masukkan nomor hp terdaftar pada Sakuku', 55925, 55675, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1830, '1037', '1037', 'E-Money Sakuku', 'Sakuku 60.000', 'masukkan nomor hp terdaftar pada Sakuku', 60850, 60600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1831, '1038', '1038', 'E-Money Sakuku', 'Sakuku 65.000', 'masukkan nomor hp terdaftar pada Sakuku', 65925, 65675, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1832, '1039', '1039', 'E-Money Sakuku', 'Sakuku 70.000', 'masukkan nomor hp terdaftar pada Sakuku', 70850, 70600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1833, '1040', '1040', 'E-Money Sakuku', 'Sakuku 75.000', 'masukkan nomor hp terdaftar pada Sakuku', 75925, 75675, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1834, '1041', '1041', 'E-Money Sakuku', 'Sakuku 80.000', 'masukkan nomor hp terdaftar pada Sakuku', 80850, 80600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1835, '1042', '1042', 'E-Money Sakuku', 'Sakuku 85.000', 'masukkan nomor hp terdaftar pada Sakuku', 85925, 85675, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1836, '1043', '1043', 'E-Money Sakuku', 'Sakuku 90.000', 'masukkan nomor hp terdaftar pada Sakuku', 90850, 90600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1837, '1044', '1044', 'E-Money Sakuku', 'Sakuku 95.000', 'masukkan nomor hp terdaftar pada Sakuku', 95925, 95675, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1838, '1045', '1045', 'E-Money Sakuku', 'Sakuku 100.000', 'masukkan nomor hp terdaftar pada Sakuku', 100850, 100600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1839, '1049', '1049', 'E-Money OVO', 'OVO 10.000', '-', 9755, 9505, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1840, '1051', '1051', 'E-Money OVO', 'OVO 20.000', 'OVO 20.000', 19760, 19510, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1841, '1047', '1047', 'E-Money OVO', 'OVO 5.000', 'OVO 5.000', 5905, 5655, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1842, '1053', '1053', 'E-Money OVO', 'OVO 25.000', 'OVO 25.000', 24760, 24510, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1843, '1055', '1055', 'E-Money OVO', 'OVO 30.000', 'OVO 30.000', 29775, 29525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1844, '1057', '1057', 'E-Money OVO', 'OVO 35.000', 'OVO 35.000', 36050, 35800, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1845, '1059', '1059', 'E-Money OVO', 'OVO 40.000', 'OVO 40.000', 39775, 39525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1846, '1065', '1065', 'E-Money OVO', 'OVO 55.000', 'OVO 55.000', 56050, 55800, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1847, '1068', '1068', 'E-Money OVO', 'OVO 65.000', 'OVO 65.000', 65800, 65550, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1848, '1072', '1072', 'E-Money OVO', 'OVO 75.000', 'OVO 75.000', 74775, 74525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1849, '1074', '1074', 'E-Money OVO', 'OVO 80.000', 'OVO 80.000', 79775, 79525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1850, '1076', '1076', 'E-Money OVO', 'OVO 90.000', 'OVO 90.000', 89775, 89525, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1851, '1110', '1110', 'Data XL', 'XL HOTROD 16 GB / 30 Hari', '-', 200925, 200675, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(1852, '1456', '1456', 'Voucher POINT BLANK', 'Voucher 1200 PB Cash', 'Voucher 1200 PB Cash', 9500, 9250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1853, '1457', '1457', 'Voucher POINT BLANK', 'Voucher 2400 PB Cash', 'Voucher 2400 PB Cash', 18500, 18250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1854, '1458', '1458', 'Voucher POINT BLANK', 'Voucher 6000 PB Cash', 'Voucher 6000 PB Cash', 45500, 45250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1855, '1459', '1459', 'Voucher POINT BLANK', 'Voucher 12000 PB Cash', 'Voucher 12000 PB Cash', 90500, 90250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1856, '1460', '1460', 'Voucher POINT BLANK', 'Voucher 36000 PB Cash', 'Voucher 36000 PB Cash', 285500, 285250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1857, '1461', '1461', 'Voucher POINT BLANK', 'Voucher 60000 PB Cash', 'Voucher 60000 PB Cash', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1858, '1462', '1462', 'Voucher PUBG', 'PUBG Early Bird Key', '-', 35000, 34750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1859, '1463', '1463', 'Voucher PUBG', 'PUBG Steam Game Key', '-', 215500, 215250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1860, '1464', '1464', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 60 UC', 'PUBG Mobile 60 UC Voucher', 16505, 16255, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1861, '1465', '1465', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 325 UC', 'PUBG Mobile 325 UC Voucher', 80525, 80275, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1862, '1466', '1466', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 660 UC', 'PUBG Mobile 660 UC Voucher', 160550, 160300, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1863, '1467', '1467', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 1800 UC', 'PUBG Mobile 1800 UC Voucher', 400625, 400375, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1864, '1468', '1468', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 3850 UC', 'PUBG Mobile 3850 UC Voucher', 800750, 800500, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1865, '1469', '1469', 'Voucher PUBG MOBILE', 'Voucher PUBG Mobile 8100 UC', 'PUBG Mobile 8100 UC Voucher', 1601000, 1600750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(1866, '1470', '1470', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 10.000', '-', 11375, 11125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1867, '1471', '1471', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 20.000', '-', 21375, 21125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1868, '1472', '1472', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 25.000', '-', 26375, 26125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1869, '1473', '1473', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 30.000', '-', 31200, 30950, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1870, '1474', '1474', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 40.000', '-', 41200, 40950, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1871, '1475', '1475', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 50.000', '-', 51375, 51125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1872, '1476', '1476', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 75.000', '-', 76375, 76125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1873, '1477', '1477', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 100.000', '-', 101375, 101125, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1874, '1478', '1478', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 150.000', '-', 151450, 151200, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1875, '1479', '1479', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 200.000', '-', 201450, 201200, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1876, '1480', '1480', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 250.000', '-', 251500, 251250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1877, '1481', '1481', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 300.000', '-', 301450, 301200, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1878, '1482', '1482', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 400.000', '-', 401450, 401200, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1879, '1483', '1483', 'E-Money MANDIRI E-TOLL', 'Mandiri E-Toll 500.000', '-', 501450, 501200, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1880, '1484', '1484', 'E-Money TAPCASH BNI', 'Tapcash BNI 10.000', 'Tapcash BNI 10.000', 11000, 10750, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1881, '1485', '1485', 'E-Money TAPCASH BNI', 'Tapcash BNI 20.000', 'Tapcash BNI 20.000', 21000, 20750, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1882, '1486', '1486', 'E-Money TAPCASH BNI', 'Tapcash BNI 50.000', 'Tapcash BNI 50.000', 51000, 50750, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1883, '1487', '1487', 'E-Money TAPCASH BNI', 'Tapcash BNI 100.000', 'Tapcash BNI 100.000', 101000, 100750, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1884, '1488', '1488', 'E-Money TAPCASH BNI', 'Tapcash BNI 250.000', 'Tapcash BNI 250.000', 251500, 251250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1885, '1489', '1489', 'E-Money TAPCASH BNI', 'Tapcash BNI 500.000', 'Tapcash BNI 500.000', 501500, 501250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1886, '1490', '1490', 'E-Money BRI BRIZZI', 'BRIZZI 20.000', 'Saldo BRIZZI 20.000', 21275, 21025, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1887, '1491', '1491', 'E-Money BRI BRIZZI', 'BRIZZI 50.000', 'Saldo BRIZZI 50.000', 51275, 51025, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1888, '1492', '1492', 'E-Money BRI BRIZZI', 'BRIZZI 100.000', 'Saldo BRIZZI 100.000', 101275, 101025, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1889, '1493', '1493', 'E-Money BRI BRIZZI', 'BRIZZI 200.000', 'Saldo BRIZZI 200.000', 201500, 201250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1890, '1494', '1494', 'E-Money BRI BRIZZI', 'BRIZZI 300.000', 'Saldo BRIZZI 300.000', 301500, 301250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1891, '1495', '1495', 'E-Money BRI BRIZZI', 'BRIZZI 400.000', 'Saldo BRIZZI 400.000', 401500, 401250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1892, '1496', '1496', 'E-Money BRI BRIZZI', 'BRIZZI 500.000', 'Saldo BRIZZI 500.000', 501500, 501250, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1893, '1505', '1505', 'E-Money Mitra Shopee', 'Mitra Shopee 200.000', '-', 200750, 200500, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1894, '1506', '1506', 'E-Money i.saku', 'i.saku 10.000', 'saldo i.saku 10.000', 11850, 11600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1895, '1507', '1507', 'E-Money i.saku', 'i.saku 11.000', 'saldo i.saku 11.000', 12775, 12525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1896, '1508', '1508', 'E-Money i.saku', 'i.saku 12.000', 'saldo i.saku 12.000', 13775, 13525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1897, '1509', '1509', 'E-Money i.saku', 'i.saku 13.000', 'saldo i.saku 13.000', 14775, 14525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1898, '1510', '1510', 'E-Money i.saku', 'i.saku 14.000', 'saldo i.saku 14.000', 15775, 15525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1899, '1511', '1511', 'E-Money i.saku', 'i.saku 15.000', 'saldo i.saku 15.000', 16775, 16525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1900, '1512', '1512', 'E-Money i.saku', 'i.saku 20.000', 'saldo i.saku 20.000', 21850, 21600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1901, '1513', '1513', 'E-Money i.saku', 'i.saku 25.000', 'saldo i.saku 25.000', 26775, 26525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1902, '1514', '1514', 'E-Money i.saku', 'i.saku 30.000', 'saldo i.saku 30.000', 31850, 31600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1903, '1515', '1515', 'E-Money i.saku', 'i.saku 35.000', 'saldo i.saku 35.000', 36775, 36525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1904, '1516', '1516', 'E-Money i.saku', 'i.saku 40.000', 'saldo i.saku 40.000', 41850, 41600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1905, '1517', '1517', 'E-Money i.saku', 'i.saku 100.000', 'saldo i.saku 100.000', 101850, 101600, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1906, '1518', '1518', 'E-Money i.saku', 'i.saku 150.000', 'saldo i.saku 150.000', 151775, 151525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1907, '1519', '1519', 'E-Money i.saku', 'i.saku 200.000', 'saldo i.saku 200.000', 201775, 201525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1908, '1520', '1520', 'E-Money i.saku', 'i.saku 250.000', 'saldo i.saku 250.000', 251775, 251525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1909, '1521', '1521', 'E-Money i.saku', 'i.saku 300.000', 'saldo i.saku 300.000', 301775, 301525, 'Tidak', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(1910, '1525', '1525', 'Games GARENA', 'Garena 165 Shell', 'Tujuan = ID garena', 46125, 45875, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1911, '1524', '1524', 'Games GARENA', 'Garena 330 Shell', 'Tujuan = ID garena', 92025, 91775, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1912, '1523', '1523', 'Games GARENA', 'Garena 66 Shell', 'Tujuan = ID garena', 18760, 18510, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1913, '1522', '1522', 'Games GARENA', 'Garena 33 Shell', 'Tujuan = ID garena', 9640, 9390, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1914, '1526', '1526', 'Games POINT BLANK', '1200 PB Cash', '1200 Point Blank Cash', 9925, 9675, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1915, '1527', '1527', 'Games POINT BLANK', '2400 PB Cash', '2400 PB Cash', 19150, 18900, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1916, '1528', '1528', 'Games POINT BLANK', '6000 PB Cash', '6000 PB Cash', 47850, 47600, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1917, '1529', '1529', 'Games POINT BLANK', '12000 PB Cash', '12000 PB Cash', 93950, 93700, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1918, '1530', '1530', 'Games POINT BLANK', '36000 PB Cash', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1919, '1531', '1531', 'Games POINT BLANK', '60000 PB Cash', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1920, '1532', '1532', 'Games Ragnarok M: Eternal Love', '1 Big Cat Coins', '1 Big Cat Coins', 4700, 4450, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1921, '1533', '1533', 'Games Ragnarok M: Eternal Love', '3 Big Cat Coins', '3 Big Cat Coins', 8360, 8110, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1922, '1534', '1534', 'Games Ragnarok M: Eternal Love', '4 Big Cat Coins', '4 Big Cat Coins', 10760, 10510, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1923, '1535', '1535', 'Games Ragnarok M: Eternal Love', '5 Big Cat Coins', '5 Big Cat Coins', 13150, 12900, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1924, '1536', '1536', 'Games Ragnarok M: Eternal Love', '7 Big Cat Coins', '7 Big Cat Coins', 18450, 18200, 'Tidak', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1925, '1537', '1537', 'Games Ragnarok M: Eternal Love', '20 Big Cat Coins', '20 Big Cat Coins', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1926, '1538', '1538', 'Games Ragnarok M: Eternal Love', '40 Big Cat Coins', '40 Big Cat Coins', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1927, '1539', '1539', 'Games Ragnarok M: Eternal Love', '80 Big Cat Coins', '80 Big Cat Coins', 201600, 201350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1928, '1540', '1540', 'Games Ragnarok M: Eternal Love', '120 Big Cat Coins', '120 Big Cat Coins', 290530, 290280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1929, '1541', '1541', 'Games Ragnarok M: Eternal Love', '298 Big Cat Coins', '298 Big Cat Coins', 717330, 717080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1930, '1542', '1542', 'Games ARENA OF VALOR', 'AOV 7 Vouchers', 'AOV 7 Vouchers', 2355, 2105, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1931, '1543', '1543', 'Games ARENA OF VALOR', 'AOV 18 Vouchers', 'AOV 18 Vouchers', 5055, 4805, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1932, '1544', '1544', 'Games ARENA OF VALOR', 'AOV 40 Vouchers', 'AOV 40 Vouchers', 9600, 9350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1933, '1545', '1545', 'Games ARENA OF VALOR', 'AOV 90 Vouchers', 'AOV 90 Vouchers', 18600, 18350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1934, '1546', '1546', 'Games ARENA OF VALOR', 'AOV 230 Vouchers', 'AOV 230 Vouchers', 45650, 45400, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1935, '1547', '1547', 'Games ARENA OF VALOR', 'AOV 470 Vouchers', 'AOV 470 Vouchers', 90700, 90450, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1936, '1548', '1548', 'Games ARENA OF VALOR', 'AOV 950 Vouchers', 'AOV 950 Vouchers', 180650, 180400, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1937, '1549', '1549', 'Games ARENA OF VALOR', 'AOV 1430 Vouchers', 'AOV 1430 Vouchers', 270900, 270650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1938, '1550', '1550', 'Games ARENA OF VALOR', 'AOV 2390 Vouchers', 'AOV 2390 Vouchers', 470800, 470550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1939, '1551', '1551', 'Games ARENA OF VALOR', 'AOV 4800 Vouchers', 'AOV 4800 Vouchers', 951150, 950900, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1940, '1552', '1552', 'Games ARENA OF VALOR', 'AOV 24050 Vouchers', 'AOV 24050 Vouchers', 4752400, 4752150, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1941, '1553', '1553', 'Games ARENA OF VALOR', 'AOV 48200 Vouchers', 'AOV 48200 Vouchers', 9502400, 9502150, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1942, '1595', '1595', 'Games AU2 MOBILE', 'AU2 72 Diamonds', 'AU2 Mobile 72 Diamonds', 15050, 14800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1943, '1596', '1596', 'Games AU2 MOBILE', 'AU2 144 Diamonds', 'AU2 Mobile 144 Diamonds', 28630, 28380, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1944, '1597', '1597', 'Games AU2 MOBILE', 'AU2 360 Diamonds', 'AU2 Mobile 360 Diamonds', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1945, '1598', '1598', 'Games AU2 MOBILE', 'AU2 816 Diamonds', 'AU2 Mobile 816 Diamonds', 145030, 144780, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1946, '1599', '1599', 'Games AU2 MOBILE', 'AU2 1536 Diamonds', 'AU2 Mobile 1536 Diamonds', 290530, 290280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1947, '1600', '1600', 'Games AU2 MOBILE', 'AU2 2376 Diamonds', 'AU2 Mobile 2376 Diamonds', 426330, 426080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1948, '1601', '1601', 'Games AU2 MOBILE', 'AU2 7776 Diamonds', 'AU2 Mobile 7776 Diamonds', 1454530, 1454280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1949, '1602', '1602', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 260M Koin', 'DOMINO QIUQIU 260M Koin', 5350, 5100, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1950, '1603', '1603', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 286M Koin', 'DOMINO QIUQIU 286M Koin', 5835, 5585, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1951, '1604', '1604', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 564M Koin', 'DOMINO QIUQIU 564M Koin', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1952, '1605', '1605', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 600.6M Koin', 'DOMINO QIUQIU 600.6M Koin', 11170, 10920, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1953, '1606', '1606', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 1.3B Koin', 'DOMINO QIUQIU 1.3B Koin', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1954, '1607', '1607', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 1.43B Koin', 'DOMINO QIUQIU 1.43B Koin', 21840, 21590, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1955, '1608', '1608', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 3.77B Koin', 'DOMINO QIUQIU 3.77B Koin', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1956, '1609', '1609', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 4.14B Koin', 'DOMINO QIUQIU 4.14B Koin', 53850, 53600, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1957, '1610', '1610', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 7.8B Koin', 'DOMINO QIUQIU 7.8B Koin', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1958, '1611', '1611', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 8.58B Koin', 'DOMINO QIUQIU 8.58B Koin', 107200, 106950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1959, '1612', '1612', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 19.5B Koin', 'DOMINO QIUQIU 19.5B Koin', 194500, 194250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1960, '1613', '1613', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 30.42B Koin', 'DOMINO QIUQIU 30.42B Koin', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1961, '1614', '1614', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 33.46B Koin', 'DOMINO QIUQIU 33.46B Koin', 320600, 320350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1962, '1615', '1615', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 52B Koin', 'DOMINO QIUQIU 52B Koin', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1963, '1616', '1616', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 57.2B Koin', 'DOMINO QIUQIU 57.2B Koin', 534000, 533750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1964, '1617', '1617', 'Games BOYAA DOMINO QIUQIU', 'DOMINO QIUQIU 106.6B Koin', 'DOMINO QIUQIU 106.6B Koin', 970500, 970250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1965, '1618', '1618', 'Games Laplace M', 'Laplace M 60 Spirals', 'Laplace M 60 Spirals', 15050, 14800, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1966, '1619', '1619', 'Games Laplace M', 'Laplace M 300 Spirals', 'Laplace M 300 Spirals', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1967, '1620', '1620', 'Games Laplace M', 'Laplace M 980 Spirals', 'Laplace M 980 Spirals', 212930, 212680, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1968, '1621', '1621', 'Games Laplace M', 'Laplace M 1980 Spirals', 'Laplace M 1980 Spirals', 426330, 426080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1969, '1622', '1622', 'Games Laplace M', 'Laplace M 3280 Spirals', 'Laplace M 3280 Spirals', 717330, 717080, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1970, '1623', '1623', 'Games Laplace M', 'Laplace M 6480 Spirals', 'Laplace M 6480 Spirals', 1454530, 1454280, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1971, '1624', '1624', 'Games Lords Mobile', 'Lords Mobile 67 Diamonds', 'Lords Mobile 67 Diamonds', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1972, '1625', '1625', 'Games Lords Mobile', 'Lords Mobile 123 Diamonds', 'Lords Mobile 123 Diamonds', 17250, 17000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1973, '1626', '1626', 'Games Lords Mobile', 'Lords Mobile 134 Diamonds', 'Lords Mobile 134 Diamonds', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1974, '1627', '1627', 'Games Lords Mobile', 'Lords Mobile 246 Diamonds', 'Lords Mobile 246 Diamonds', 34000, 33750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1975, '1628', '1628', 'Games Lords Mobile', 'Lords Mobile 335 Diamonds', 'Lords Mobile 335 Diamonds', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1976, '1629', '1629', 'Games Lords Mobile', 'Lords Mobile 670 Diamonds', 'Lords Mobile 670 Diamonds', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1977, '1630', '1630', 'Games Lords Mobile', 'Lords Mobile 737 Diamonds', 'Lords Mobile 737 Diamonds', 99500, 99250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1978, '1631', '1631', 'Games Lords Mobile', 'Lords Mobile 1228 Diamonds', 'Lords Mobile 1228 Diamonds', 165500, 165250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1979, '1632', '1632', 'Games Lords Mobile', 'Lords Mobile 2011 Diamonds', 'Lords Mobile 2011 Diamonds', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1980, '1633', '1633', 'Games Lords Mobile', 'Lords Mobile 3352 Diamonds', 'Lords Mobile 3352 Diamonds', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1981, '1634', '1634', 'Games Lords Mobile', 'Lords Mobile 7365 Diamonds', 'Lords Mobile 7365 Diamonds', 980500, 980250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1982, '1635', '1635', 'Games Starpass', '80 Goldstar', '80 Goldstar', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1983, '1636', '1636', 'Games Starpass', '200 Goldstar', '200 Goldstar', 29600, 29350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1984, '1637', '1637', 'Games Starpass', '400 Goldstar', '400 Goldstar', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1985, '1638', '1638', 'Games Starpass', '800 Goldstar', '800 Goldstar', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1986, '1640', '1640', 'Games Knights of Valour', 'Knights of Valour 8 Gold', '-', 2085, 1835, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1987, '1641', '1641', 'Games Knights of Valour', 'Knights of Valour 16 Gold', '-', 3410, 3160, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1988, '1642', '1642', 'Games Knights of Valour', 'Knights of Valour 44 Gold', '-', 8260, 8010, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1989, '1643', '1643', 'Games Knights of Valour', 'Knights of Valour 55 Gold', '-', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1990, '1644', '1644', 'Games Knights of Valour', 'Knights of Valour 110 Gold', '-', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1991, '1645', '1645', 'Games Knights of Valour', 'Knights of Valour 275 Gold', '-', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1992, '1646', '1646', 'Games Knights of Valour', 'Knights of Valour 550 Gold', '-', 97500, 97250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1993, '1647', '1647', 'Games Knights of Valour', 'Knights of Valour 1100 Gold', '-', 194500, 194250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1994, '1648', '1648', 'Games Knights of Valour', 'Knights of Valour 1650 Gold', '-', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1995, '1649', '1649', 'Games Knights of Valour', 'Knights of Valour 2750 Gold', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1996, '1650', '1650', 'Games Knights of Valour', 'Knights of Valour 5500 Gold', '-', 970500, 970250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1997, '1651', '1651', 'Games Knights of Valour', 'Knights of Valour 11000 Gold', '-', 1940500, 1940250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1998, '1652', '1652', 'Games DRAGON RAJA - SEA', 'Dragon Raja 90 Coupons', 'Masukkan ID Player di dalam game.', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(1999, '1653', '1653', 'Games DRAGON RAJA - SEA', 'Dragon Raja 337 Coupons', 'Masukkan ID Player di dalam game.', 73250, 73000, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2000, '1654', '1654', 'Games DRAGON RAJA - SEA', 'Dragon Raja 988 Coupons', 'Masukkan ID Player di dalam game.', 194500, 194250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2001, '1655', '1655', 'Games DRAGON RAJA - SEA', 'Dragon Raja 2553 Coupons', 'Masukkan ID Player di dalam game.', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2002, '1656', '1656', 'Games DRAGON RAJA - SEA', 'Dragon Raja 3589 Coupons', 'Masukkan ID Player di dalam game.', 679500, 679250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2003, '1657', '1657', 'Games DRAGON RAJA - SEA', 'Dragon Raja 7546 Coupons', 'Masukkan ID Player di dalam game.', 1455500, 1455250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2004, '1658', '1658', 'Games DRAGON RAJA - SEA', 'Dragon Raja 15092 Coupons', 'Masukkan ID Player di dalam game.', 2910500, 2910250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2005, '1659', '1659', 'Games Bullet Angel', 'Bullet Angel 75 gems', 'langsung masuk ke akun.', 10200, 9950, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2006, '1660', '1660', 'Games Bullet Angel', 'Bullet Angel 146 gems', 'langsung masuk ke akun.', 19900, 19650, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2007, '1661', '1661', 'Games Bullet Angel', 'Bullet Angel 220 gems', 'langsung masuk ke akun.', 29600, 29350, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2008, '1662', '1662', 'Games Bullet Angel', 'Bullet Angel 366 gems', 'langsung masuk ke akun.', 49000, 48750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2009, '1663', '1663', 'Games Bullet Angel', 'Bullet Angel 660 gems', 'langsung masuk ke akun.', 87800, 87550, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2010, '1664', '1664', 'Games Bullet Angel', 'Bullet Angel 1100 gems', 'langsung masuk ke akun.', 146000, 145750, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2011, '1665', '1665', 'Games Bullet Angel', 'Bullet Angel 2200 gems', 'langsung masuk ke akun.', 291500, 291250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2012, '1666', '1666', 'Games Bullet Angel', 'Bullet Angel 3666 gems', 'langsung masuk ke akun.', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Games', 'TOP UP'),
(2013, '1700', '1700', 'Voucher MEGAXUS', 'Megaxus 10.000 MI-Cash', '-', 11480, 11230, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2014, '1701', '1701', 'Voucher MEGAXUS', 'Megaxus 20.000 MI-Cash', '-', 22500, 22250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2015, '1702', '1702', 'Voucher MEGAXUS', 'Megaxus 50.000 MI-Cash', '-', 55000, 54750, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2016, '1703', '1703', 'Voucher MEGAXUS', 'Megaxus 100.000 MI-Cash', '-', 110300, 110050, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2017, '1704', '1704', 'Voucher MEGAXUS', 'Megaxus 210.000 MI-Cash', '-', 220500, 220250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2018, '1705', '1705', 'Voucher MEGAXUS', 'Megaxus 550.000 MI-Cash', '-', 545500, 545250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2019, '1706', '1706', 'Voucher Razer Gold', 'Razer Gold 10.000', '-', 10650, 10400, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2020, '1707', '1707', 'Voucher Razer Gold', 'Razer Gold 20.000', '-', 20550, 20300, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2021, '1708', '1708', 'Voucher Razer Gold', 'Razer Gold 50.000', '-', 50300, 50050, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2022, '1709', '1709', 'Voucher Razer Gold', 'Razer Gold 100.000', '-', 98700, 98450, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2023, '1710', '1710', 'Voucher Razer Gold', 'Razer Gold 200.000', '-', 195800, 195550, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2024, '1711', '1711', 'Voucher Razer Gold', 'Razer Gold 500.000', '-', 485500, 485250, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2025, '1712', '1712', 'Voucher Razer Gold', 'Razer Gold 1.000.000', '-', 966600, 966350, 'Ya', 'Normal', 'DG-PULSA', 'Voucher', 'TOP UP'),
(2026, '1715', '1715', 'Aktivasi Voucher INDOSAT', 'Isi Voucher Blank Indosat 500 MB + Youtube Unlimited / 3 Hari', 'Produk ini untuk isi Voucher kosongan.', 5530, 5280, 'Tidak', 'Normal', 'DG-PULSA', 'Aktivasi Voucher', 'TOP UP');
INSERT INTO `layanan_pulsa` (`id`, `service_id`, `provider_id`, `operator`, `layanan`, `deskripsi`, `harga`, `harga_api`, `multi`, `status`, `provider`, `tipe`, `server`) VALUES
(2027, '1716', '1716', 'Aktivasi Voucher INDOSAT', 'Isi Voucher Blank Indosat 1 GB + Youtube Unlimited / 7 Hari', 'Produk ini untuk isi Voucher kosongan.', 15535, 15285, 'Tidak', 'Normal', 'DG-PULSA', 'Aktivasi Voucher', 'TOP UP'),
(2028, '1717', '1717', 'Aktivasi Voucher INDOSAT', 'Isi Voucher Blank Indosat 1 GB (3G/4G) + 500 MB (APLIKASI) + 1 GB (01-06) / 30 Hari', 'Produk ini untuk isi Voucher kosongan.', 20055, 19805, 'Ya', 'Normal', 'DG-PULSA', 'Aktivasi Voucher', 'TOP UP'),
(2029, '1760', '1760', 'E-Money DANA', 'DANA 300.000', '-', 300645, 300395, 'Ya', 'Normal', 'DG-PULSA', 'E-Money', 'TOP UP'),
(2030, '1724', '1724', 'TV Nex & Garuda', 'Nex & Garuda Paket 30 FTV 30 Hari', 'Siaran Lokal & Hiburan ( Minus MNC Groups) Khusus Receiver Matrix', 44500, 44250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2031, '1725', '1725', 'TV Nex & Garuda', 'Nex & Garuda Paket 2001 Family 30 Hari', '-', 34500, 34250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2032, '1726', '1726', 'TV Nex & Garuda', 'Nex & Garuda Paket 2003 Family 90 Hari', '-', 96500, 96250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2033, '1727', '1727', 'TV Nex & Garuda', 'Nex & Garuda Paket 2006 Family 180 Hari', '-', 176000, 175750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2034, '1728', '1728', 'TV Nex & Garuda', 'Nex & Garuda Paket 2012 Family 360 Hari', '-', 316500, 316250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2035, '1729', '1729', 'TV Nex & Garuda', 'Nex & Garuda Paket 2300 Bulu Tangkis 1 Musim', 'Bulu tangkis ( BWF )', 237220, 236970, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2036, '1730', '1730', 'TV Nex & Garuda', 'Nex & Garuda Paket 2301 Bulu Tangkis 30 Hari', 'Bulu tangkis ( BWF )', 26000, 25750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2037, '1731', '1731', 'TV Nex & Garuda', 'Nex & Garuda Paket 2303 Bulu Tangkis 90 Hari', 'Bulu tangkis ( BWF )', 70000, 69750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2038, '1732', '1732', 'TV Nex & Garuda', 'Nex & Garuda Paket 2306 Bulu Tangkis 180 Hari', 'Bulu tangkis ( BWF )', 131620, 131370, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2039, '1733', '1733', 'TV Nex & Garuda', 'Nex & Garuda Paket 2500 Champions 1 Musim', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF)', 474820, 474570, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2040, '1734', '1734', 'TV Nex & Garuda', 'Nex & Garuda Paket 2501 Champions 30 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF)', 52500, 52250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2041, '1735', '1735', 'TV Nex & Garuda', 'Nex & Garuda Paket 2503 Champions 90 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF)', 140420, 140170, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2042, '1736', '1736', 'TV Nex & Garuda', 'Nex & Garuda Paket 2506 Champions 180 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF)', 272420, 272170, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2043, '1737', '1737', 'TV Nex & Garuda', 'Nex & Garuda Paket 2701 Mola 30 Hari', 'Mola', 88000, 87750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2044, '1738', '1738', 'TV Nex & Garuda', 'Nex & Garuda Paket 2703 Mola 90 Hari', 'Mola', 184420, 184170, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2045, '1739', '1739', 'TV Nex & Garuda', 'Nex & Garuda Paket 2801 Movies 30 Hari', 'Paket Fox Movies, Fox Action & Fox Family', 22500, 22250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2046, '1740', '1740', 'TV Nex & Garuda', 'Nex & Garuda Paket 2803 Movies 90 Hari', 'Paket Fox Movies, Fox Action & Fox Family', 61200, 60950, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2047, '1741', '1741', 'TV Nex & Garuda', 'Nex & Garuda Paket 2806 Movies 180 Hari', 'Paket Fox Movies, Fox Action & Fox Family', 114000, 113750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2048, '1742', '1742', 'TV Nex & Garuda', 'Nex & Garuda Paket 2812 Movies 360 Hari', 'Paket Fox Movies, Fox Action & Fox Family', 202000, 201750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2049, '1743', '1743', 'TV Nex & Garuda', 'Nex & Garuda Paket 2901 All Channel 30 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF), Mola', 140400, 140150, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2050, '1744', '1744', 'TV Nex & Garuda', 'Nex & Garuda Paket 2903 All Channel 90 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF), Mola', 378000, 377750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2051, '1745', '1745', 'TV Nex & Garuda', 'Nex & Garuda Paket 2906 All Channel 180 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF), Mola', 712400, 712150, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2052, '1746', '1746', 'TV Nex & Garuda', 'Nex & Garuda Paket 2912 All Channel 360 Hari', 'Liga Champion, Championship ( EFL ), ATP, WTA,ATP Tour, Bulu Tangkis (BWF), Mola', 1258000, 1257750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2053, '17478', '17478', 'TV Nex & Garuda', 'Nex & Garuda Paket 3101 Fox Sports 30 Hari', 'Paket Fox Sports, Fox Sports 1 & Fox Sports 2', 26000, 25750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2054, '1748', '1748', 'TV Nex & Garuda', 'Nex & Garuda Paket 3103 Fox Sports 90 Hari', 'Paket Fox Sports, Fox Sports 1 & Fox Sports 2', 70000, 69750, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2055, '1749', '1749', 'TV Nex & Garuda', 'Nex & Garuda Paket 3106 Fox Sports 180 Hari', 'Paket Fox Sports, Fox Sports 1 & Fox Sports 2', 131500, 131250, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2056, '1750', '1750', 'TV Nex & Garuda', 'Nex & Garuda Paket 3112 Fox Sports 360 Hari', 'Paket Fox Sports, Fox Sports 1 & Fox Sports 2', 237200, 236950, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2057, '1751', '1751', 'TV Nex & Garuda', 'Nex & Garuda Paket 3501 Premium', 'Film, Fox Sport & Champions', 87650, 87400, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2058, '1752', '1752', 'TV Nex & Garuda', 'Nex & Garuda Paket 3700 Walikota Solo', 'Piala Walikota Solo 2021', 18100, 17850, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2059, '1753', '1753', 'TV Nex & Garuda', 'Nex & Garuda Paket 3900 Tour de Java', '4 Match Bali United', 26100, 25850, 'Ya', 'Normal', 'DG-PULSA', 'TV', 'TOP UP'),
(2060, '1721', '1721', 'Paket SMS Telpon AXIS', 'Axis Telepon 30 Menit Semua Op / 7 Hari', 'Axis Telepon 30 Menit ke Semua Operator / 7 Hari', 8500, 8250, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(2061, '1722', '1722', 'Paket SMS Telpon AXIS', 'Axis Telepon 100 Menit Semua Op / 30 Hari', 'Axis Telepon 100 Menit ke Semua Operator / 30 Hari', 25000, 24750, 'Tidak', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(2062, '1723', '1723', 'Paket SMS Telpon AXIS', 'Axis Telepon Sepuasnya Sesama / 14 Hari', 'Axis Telepon Sepuasnya ke Sesama / 14 Hari', 1255, 1005, 'Ya', 'Normal', 'DG-PULSA', 'Paket SMS Telpon', 'TOP UP'),
(2063, '1900', '1900', 'Data INDOSAT', 'GIFT DATA 50 MB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 1330, 1080, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2064, '1901', '1901', 'Data INDOSAT', 'GIFT DATA 100 MB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 1405, 1155, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2065, '1902', '1902', 'Data INDOSAT', 'GIFT DATA 150 MB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 2314, 2064, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2066, '1903', '1903', 'Data INDOSAT', 'GIFT DATA 200 MB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 2105, 1855, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2067, '1904', '1904', 'Data INDOSAT', 'GIFT DATA 250 MB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 2450, 2200, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2068, '1905', '1905', 'Data INDOSAT', 'GIFT DATA 1 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 8500, 8250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2069, '1906', '1906', 'Data INDOSAT', 'GIFT DATA 1.5 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 12780, 12530, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2070, '1907', '1907', 'Data INDOSAT', 'GIFT DATA 2 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 15025, 14775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2071, '1908', '1908', 'Data INDOSAT', 'GIFT DATA 2.5 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 20760, 20510, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2072, '1909', '1909', 'Data INDOSAT', 'GIFT DATA 3 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 22500, 22250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2073, '1910', '1910', 'Data INDOSAT', 'GIFT DATA 4 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 29700, 29450, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2074, '1911', '1911', 'Data INDOSAT', 'GIFT DATA 4.5 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 34125, 33875, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2075, '1912', '1912', 'Data INDOSAT', 'GIFT DATA 5 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 36500, 36250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2076, '1913', '1913', 'Data INDOSAT', 'GIFT DATA 6 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 48000, 47750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2077, '1914', '1914', 'Data INDOSAT', 'GIFT DATA 7 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 54000, 53750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2078, '1915', '1915', 'Data INDOSAT', 'GIFT DATA 8 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 63050, 62800, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2079, '1916', '1916', 'Data INDOSAT', 'GIFT DATA 9 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 72335, 72085, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2080, '1917', '1917', 'Data INDOSAT', 'GIFT DATA 10 GB', 'Kuota 24 jam, masa aktif 30 hari, bisa digabung dengan paket data yang sudah ada', 80315, 80065, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2081, '1918', '1918', 'Data INDOSAT', 'Apps Kuota 5GB 30hr', '-', 24695, 24445, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2082, '1919', '1919', 'Data INDOSAT', 'Apps Kuota 10GB 30hr', '-', 37195, 36945, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2083, '1920', '1920', 'Data INDOSAT', 'Apps Kuota 15GB 30hr', '-', 50500, 50250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2084, '1921', '1921', 'Data INDOSAT', 'Apps Kuota 20GB 30hr', '-', 64595, 64345, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2085, '1922', '1922', 'Data INDOSAT', 'Indosat Paket Ekstra 2GB', 'Paket Ekstra 2GB, Tanpa batas waktu (24 jam). Hanya berlaku bagi pelanggan paket Super Internet Kuota, Super Internet Paket Khusus, SP Mentari 3GB, Super Internet Unlimited dan Freedom Combo.', 30500, 30250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2086, '1923', '1923', 'Data INDOSAT', 'Indosat Paket Ekstra 4GB', 'Paket Ekstra 4GB, Tanpa batas waktu (24 jam). Hanya berlaku bagi pelanggan paket Super Internet Kuota, Super Internet Paket Khusus, SP Mentari 3GB, Super Internet Unlimited dan Freedom Combo.', 45500, 45250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2087, '1924', '1924', 'Data INDOSAT', 'Indosat Paket Ekstra 6GB', 'Paket Ekstra 6GB, Tanpa batas waktu (24 jam). Hanya berlaku bagi pelanggan paket Super Internet Kuota, Super Internet Paket Khusus, SP Mentari 3GB, Super Internet Unlimited dan Freedom Combo.', 59500, 59250, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2088, '1925', '1925', 'Data INDOSAT', 'Indosat Freedom U 500 MB + 1 GB Apps / 2 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 5600, 5350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2089, '1926', '1926', 'Data INDOSAT', 'Indosat Freedom U 1 GB + 2 GB Apps / 7 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 15310, 15060, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2090, '1927', '1927', 'Data INDOSAT', 'Indosat Freedom U 1 GB + 4.5 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 24445, 24195, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2091, '1928', '1928', 'Data INDOSAT', 'Indosat Freedom U 2 GB + 7.5 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 37025, 36775, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2092, '1929', '1929', 'Data INDOSAT', 'Indosat Freedom U 3 GB + 15 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 56120, 55870, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2093, '1930', '1930', 'Data INDOSAT', 'Indosat Freedom U 5 GB / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 63000, 62750, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2094, '1931', '1931', 'Data INDOSAT', 'Indosat Freedom U 7 GB + 20 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 74000, 73750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2095, '1932', '1932', 'Data INDOSAT', 'Indosat Freedom U 10 GB + 25 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 93050, 92800, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2096, '1933', '1933', 'Data INDOSAT', 'Indosat Freedom U 15 GB + 25 GB Apps / 30 Hari', 'cek di https://www.indosatooredoo.com/portal/id/psfreedomu', 122800, 122550, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2097, '1934', '1934', 'Data INDOSAT', 'Indosat Freedom U JUMBO / 30 Hari', '60 GB Kuota Utama + Telepon 100 Menit + 100 SMS semua op + Unlimited Streaming + Unlimited Apps Belajar + Unlimited Telepon dan SMS ke sesama IM3, Berlaku 30 Hari', 145525, 145275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2098, '1935', '1935', 'Data INDOSAT', 'Indosat Freedom Longlife 8 GB / 60 Hari', '4 GB setiap bulan.', 44275, 44025, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2099, '1936', '1936', 'Data INDOSAT', 'Indosat Freedom Longlife 12 GB / 90 Hari', '4 GB setiap bulan.', 60645, 60395, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2100, '1937', '1937', 'Data INDOSAT', 'Indosat Freedom Longlife 20 GB / 60 Hari', '10 GB setiap bulan.', 83220, 82970, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2101, '1938', '1938', 'Data INDOSAT', 'Indosat Freedom Longlife 30 GB / 90 Hari', '10 GB setiap bulan.', 116670, 116420, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2102, '1939', '1939', 'Data INDOSAT', 'Indosat Freedom Longlife 36 GB / 60 Hari', '18 GB setiap bulan.', 121495, 121245, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2103, '1940', '1940', 'Data INDOSAT', 'Indosat Freedom Longlife 54 GB / 90 Hari', '18 GB setiap bulan.', 169495, 169245, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2104, '1941', '1941', 'Data INDOSAT', 'Indosat Data Impreneur Fit 10 GB / 30 Hari', 'Kuota utama 8 GB, aplikasi 2 GB, sepuasnya nelpon sesama, sepuasnya sms ke im3, 10 menit nelpon ke operator lain.', 50525, 50275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2105, '1942', '1942', 'Data INDOSAT', 'Indosat Yellow Gift 1 GB / 1 Hari', 'Indosat Yellow 1 GB / 1 Hari, Jalur Gift', 3600, 3350, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2106, '1947', '1947', 'Data AXIS', 'Axis Masa Aktif Kuota Internet 30 Hari', 'Khusus Kuota Inject (Elektrik) minimal Bronet 2GB ke atas dan tidak masa tenggang. Tidak berlaku untuk AIGO.', 5005, 4755, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2107, '1948', '1948', 'Data AXIS', 'Axis Masa Aktif Kuota Internet 120 Hari', 'Khusus Kuota Inject (Elektrik) minimal Bronet 2GB ke atas dan tidak masa tenggang. Tidak berlaku untuk AIGO.', 8005, 7755, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2108, '1951', '1951', 'Data TRI', 'Tri Data GetMore 4 GB / 30 Hari', '2 GB 24 Jam (60 Hari) + 2 GB Youtube dan Netflix Jam 01.00 - 17.00 (30 hari)', 19530, 19280, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2109, '1952', '1952', 'Data TRI', 'Tri Data GetMore 8 GB / 30 Hari', '4 GB 24 Jam (60 Hari) + 4 GB Youtube dan Netflix Jam 01.00 - 17.00 (30 hari)', 31225, 30975, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2110, '1953', '1953', 'Data TRI', 'Tri Data GetMore 10 GB / 30 Hari', '5 GB 24 Jam (90 Hari) + 5 GB Youtube dan Netflix Jam 01.00 - 17.00 (30 hari)', 36590, 36340, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2111, '1960', '1960', 'Data TRI', 'Tri Data Happy 1 GB / 3 Hari', 'Tri Data Happy 1 GB / 3 Hari', 5880, 5630, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2112, '2291', '2291', 'Data TRI', 'Tri Data 1 GB Nasional + 500 MB Lokal / 30 Hari', '-', 13499, 13249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2113, '2292', '2292', 'Data TRI', 'Tri Data 1.5 GB Nasional + 500 MB Lokal / 30 Hari', '-', 18499, 18249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2114, '2293', '2293', 'Data TRI', 'Tri Data 2 GB Nasional + 1 GB Lokal / 30 Hari', '-', 24499, 24249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2115, '2294', '2294', 'Data TRI', 'Tri Data 5 GB Nasional + 1 GB Lokal / 30 Hari', '-', 34499, 34249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2116, '1965', '1965', 'Data XL', 'XL XTRA KUOTA 30 GB - 30 HARI', '1GB -> Youtube, Instagram, Whatsapp, Facebook, Line, BBM | 14GB IFlix | 15GB -> Internet malam (01.00 - 06.00)', 12400, 12150, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2117, '1966', '1966', 'Data XL', 'XL XTRA KUOTA 5 GB IFLIX', '5 GB IFLIX 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2118, '1967', '1967', 'Data XL', 'XL XTRA KUOTA 2 GB Joox', '2 GB Joox 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2119, '1968', '1968', 'Data XL', 'XL XTRA KUOTA 2 GB Instagram', '2 GB Instagram 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2120, '1969', '1969', 'Data XL', 'XL XTRA KUOTA 2 GB Facebook', '2 GB Facebook 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2121, '1970', '1970', 'Data XL', 'XL XTRA KUOTA 2 GB Youtube', '2 GB Youtube 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2122, '1971', '1971', 'Data XL', 'XL XTRA KUOTA 10 GB Mobile Legends', '10 GB Mobile Legends 30 Hari', 10505, 10255, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2123, '1972', '1972', 'Data XL', 'XL XTRA KUOTA 5 GB Midnight', '5 GB Midnight 30 Hari', 10750, 10500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2124, '1973', '1973', 'Data XL', 'XL XTRA KUOTA 10 GB Waze', '10 GB Waze 30 Hari', 10750, 10500, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2125, '2200', '2200', 'Pulsa SMART', 'Smart 30.000', '-', 30195, 29945, 'Ya', 'Normal', 'DG-PULSA', 'Pulsa', 'TOP UP'),
(2126, '2250', '2250', 'Data TELKOMSEL', 'Telkomsel Data Vaganza 6 GB / 30 Hari', '6GB + 2GB OMG + 90 MNT TELP ALL OP, 30 HARI', 52500, 52250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2127, '2251', '2251', 'Data TELKOMSEL', 'Telkomsel Data Vaganza 3 GB / 30 Hari', '3GB + 2GB OMG + 60 MNT TELP ALL OP, 30 HARI', 30500, 30250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2128, '2253', '2253', 'Data TELKOMSEL', 'Telkomsel Data Vaganza 9 GB / 30 Hari', '9GB + 2GB OMG + 120 MNT TELP ALL OP, 30 HARI', 72500, 72250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2129, '2254', '2254', 'Data TELKOMSEL', 'Telkomsel Data Vaganza 15 GB / 30 Hari', '15GB + 2GB OMG + 150 MNT TELP ALL OP, 30 HARI', 90500, 90250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2130, '2255', '2255', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 3 GB', 'Internet 3 GB, Nelpon sesama 150 Menit, SMS sesama 400 SMS, berlaku 30 Hari', 29499, 29249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2131, '2256', '2256', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 5 GB', 'Telkomsel Data Combo Sakti 5 GB, 30 Hari', 38525, 38275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2132, '2257', '2257', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 11 GB', 'Internet 11 GB, Nelpon sesama 150 Menit, SMS sesama 400 SMS, berlaku 30 Hari', 65525, 65275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2133, '2258', '2258', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 15 GB', 'Telkomsel Data Combo Sakti 15 GB, 30 Hari', 80525, 80275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2134, '2259', '2259', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 17 GB', 'Internet 17 GB, Nelpon sesama 300 Menit, SMS sesama 400 SMS, Unlimited(SosChat, Games, Music, TikTok), berlaku 30 Hari', 81499, 81249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2135, '2260', '2260', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 19 GB', 'Internet 19 GB, Nelpon sesama 300 Menit, SMS sesama 400 SMS, Unlimited(SosChat, Games, Music, TikTok), berlaku 30 Hari', 85525, 85275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2136, '2261', '2261', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 22 GB', 'Tsel Data Combo Sakti 22GB, 30 Hari', 101000, 100750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2137, '2262', '2262', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 25 GB', 'Internet 25 GB, Nelpon sesama 300 Menit, SMS sesama 400 SMS, Unlimited(SosChat, Video, Games, Music, TikTok), berlaku 30 Hari', 108499, 108249, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2138, '2263', '2263', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 35 GB', 'Internet 35 GB, Nelpon sesama 600 Menit, SMS sesama 400 SMS, Unlimited(SosChat, Video, Games, Music, TikTok), berlaku 30 Hari', 159000, 158750, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2139, '2264', '2264', 'Data TELKOMSEL', 'Telkomsel Data Combo Sakti 45 GB', 'Internet 45 GB, Nelpon sesama 600 Menit, SMS sesama 400 SMS, Unlimited(SosChat, Video, Games, Music, TikTok), berlaku 30 Hari', 180500, 180250, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2140, '2265', '2265', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 1 GB / 1 Hari', '-', 6875, 6625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2141, '2266', '2266', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 1 GB / 3 Hari', '-', 7700, 7450, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2142, '2267', '2267', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 2 GB / 3 Hari', '-', 14875, 14625, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2143, '2268', '2268', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 1 GB / 7 Hari', '-', 17625, 17375, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2144, '2269', '2269', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 2 GB / 7 Hari', '-', 21375, 21125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2145, '2270', '2270', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 3 GB / 7 Hari', '-', 25375, 25125, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2146, '2271', '2271', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 5 GB / 30 Hari', '-', 38525, 38275, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2147, '2272', '2272', 'Data TELKOMSEL', 'Telkomsel Ketengan Facebook 10 GB / 30 Hari', '-', 63025, 62775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2148, '2273', '2273', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok 1 GB / 7 Hari', '1 GB TikTok, 7 Hari', 16950, 16700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2149, '2274', '2274', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok 2 GB / 7 Hari', '2 GB TikTok, 7 Hari', 21400, 21150, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2150, '2275', '2275', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok 3 GB / 7 Hari', '3 GB TikTok, 7 Hari', 24950, 24700, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2151, '2276', '2276', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok 5 GB / 30 Hari', '5 GB TikTok, 30 Hari', 36025, 35775, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2152, '2277', '2277', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok 10 GB / 30 Hari', '10 GB TikTok, 30 Hari', 59525, 59275, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2153, '2278', '2278', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok Unlimited / 1 Hari', 'Paket Ketengan Unlimited untuk akses Unlimited Tik Tok aplikasi (tanpa batasan kecepatan) berlaku selama 1 Hari hingga pukul 23.59 pada jaringan 2G/3G/4G.', 6505, 6255, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2154, '2279', '2279', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok Unlimited / 3 Hari', 'Paket Ketengan Unlimited untuk akses Unlimited Tik Tok aplikasi (tanpa batasan kecepatan) berlaku selama 3 Hari hingga pukul 23.59 pada jaringan 2G/3G/4G.', 11710, 11460, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2155, '2280', '2280', 'Data TELKOMSEL', 'Telkomsel Ketengan TikTok Unlimited / 7 Hari', 'Paket Ketengan Unlimited untuk akses Unlimited Tik Tok aplikasi (tanpa batasan kecepatan) berlaku selama 7 Hari hingga pukul 23.59 pada jaringan 2G/3G/4G.', 18310, 18060, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2156, '2281', '2281', 'Data TELKOMSEL', 'Telkomsel Musicmax 1 GB Musik + 1 GB Internet / 30 Hari', '1GB flash + 1GB musik (JOOX, SMULE, LANGITMUSIK, GUVERA, GENFM, PRAMBORS) 30 hari', 22160, 21910, 'Tidak', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2157, '2282', '2282', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 20.000', '3GB (0.5GB Nasional + 2.5GB Lokal) + Unlimited Apps (WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 25510, 25260, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2158, '2283', '2283', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 30.000', '7GB (1GB Nasional + 6GB Lokal) + Unlimited Apps (Facebook, Instagram. WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 35525, 35275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2159, '2284', '2284', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 50.000', '15GB (2GB Nasional + 13GB Lokal) + Unlimited Apps (Facebook, Instagram. WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 55525, 55275, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2160, '2285', '2285', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 70.000', '25GB (2GB Nasional + 23GB Lokal) + Unlimited Apps (YouTube, MAXstream, Facebook, Instagram, WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 79388, 79138, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2161, '2286', '2286', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 100.000', '38GB (3GB Nasional + 35GB Lokal) + Unlimited Apps (YouTube, MAXstream, Facebook, Instagram, WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 109388, 109138, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2162, '2287', '2287', 'Data TELKOMSEL', 'Telkomsel Data UnlimitedMAX 120.000', '55GB (5GB Nasional + 50GB Lokal) + Unlimited Apps (YouTube, MAXstream, Facebook, Instagram, WhatsApp, LINE, GamesMAX, MusicMAX), 30 Hari', 129388, 129138, 'Ya', 'Normal', 'DG-PULSA', 'Data', 'TOP UP'),
(2163, '', '', ' ', '', '', 500, 250, 'Tidak', 'Gangguan', 'DG-PULSA', '', 'TOP UP');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_sosmed`
--

CREATE TABLE `layanan_sosmed` (
  `id` int(11) NOT NULL,
  `service_id` int(10) NOT NULL,
  `kategori` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` text COLLATE utf8_swedish_ci NOT NULL,
  `catatan` text COLLATE utf8_swedish_ci NOT NULL,
  `min` int(10) NOT NULL,
  `max` int(10) NOT NULL,
  `harga` double NOT NULL,
  `harga_api` double NOT NULL,
  `status` enum('Aktif','Tidak Aktif') COLLATE utf8_swedish_ci NOT NULL,
  `provider_id` int(10) NOT NULL,
  `provider` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `tipe` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `layanan_sosmed`
--

INSERT INTO `layanan_sosmed` (`id`, `service_id`, `kategori`, `layanan`, `catatan`, `min`, `max`, `harga`, `harga_api`, `status`, `provider_id`, `provider`, `tipe`) VALUES
(4930, 27, 'Youtube Likes / Comments /', ' Youtube Shares', '(INSTANT - 1500 / Day Speed)', 500, 150000, 50000, 42000, 'Aktif', 27, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4931, 38, 'SoundCloud', 'SoundCloud Followers R1', '[FAST]', 100, 1000000, 49000, 41000, 'Aktif', 38, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4932, 40, 'SoundCloud', ' SoundCloud Plays', '(SUPER FAST) (S1) [MULTIPLE OF 100]  Quantity = MULTIPLE OF 100 ONLY !', 20, 10000000, 16500, 8500, 'Aktif', 40, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4933, 42, 'Pinterest', 'Pinterest Followers', '(UNLIMITED) [INSTANT]', 50, 500000, 57000, 49000, 'Aktif', 42, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4934, 108, 'Telegram', 'Telegram Post Views', '[ Last 5 post ]', 100, 5000, 84000, 76000, 'Aktif', 108, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4935, 128, 'Instagram Views', 'Instagram Views  [300k Per Day]', '[300k Per Day] - [INSTANT] - [Super FAST]', 100, 999000, 16900, 8900, 'Aktif', 128, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4936, 176, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 'Instagram Story Views UNLIMITED (USERNAME ONLY) (S1)', 50, 10000000, 20500, 12500, 'Aktif', 176, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4937, 177, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 'Instagram Story Views [20k] (USERNAME ONLY) (S2)', 100, 20000, 24500, 16500, 'Aktif', 177, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4938, 178, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [20k] [INSTANT] (S1)', 'Instagram Impressions [20k] [INSTANT] (S1)', 500, 20000, 16000, 8000, 'Aktif', 178, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4939, 266, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views (INSTANT)', 'Twitter Views (INSTANT)', 100, 1000000, 39000, 31000, 'Aktif', 266, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4940, 267, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impressions (INSTANT)', 'Twitter Impressions (INSTANT)', 100, 1000000, 39000, 31000, 'Aktif', 267, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4941, 554, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Last Story S1 - Only Username - No Refund', 'Instagram Last Story - Only Username - No Refund', 500, 10000, 17700, 9700, 'Aktif', 554, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4942, 777, 'Website Traffic', 'Website Traffic [10M] [WW]', 'Instant Start !<br>\r\n0 to 1 Hour !<br>\r\nDaily Speed = 5k-10k<br>\r\n100% Real People !!<br>\r\nGoogle Analytics Supported<br>\r\nAdSense Safe<br>\r\nMin = 100', 500, 100000000, 24200, 16200, 'Aktif', 777, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4943, 778, 'Website Traffic', 'Website Traffic From Facebook [10M] [WW]', 'Traffic From Facebook !<br>\r\nInstant Start !<br>\r\n0 to 1 Hour !<br>\r\nDaily Speed = 5k-10k<br>\r\n100% Real People !!<br>\r\nGoogle Analytics Supported<br>\r\nAdSense Safe<br>\r\nMin = 100', 500, 1000000000, 24200, 16200, 'Aktif', 778, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4944, 779, 'Website Traffic', 'Website Traffic From Instagram [10M] [WW] ', 'Traffic From Instagram !<br>\r\nInstant Start !<br>\r\n0 to 1 Hour !<br>\r\nDaily Speed = 5k-10k<br>\r\n100% Real People !!<br>\r\nGoogle Analytics Supported<br>\r\nAdSense Safe<br>\r\nMin = 100', 500, 1000000000, 24200, 16200, 'Aktif', 779, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4945, 860, 'Instagram Live Video', 'Instagram - Live Video Likes ( INSTANT )', '  Instagram - Live Video Likes ( INSTANT )', 200, 100000, 23900, 15900, 'Aktif', 860, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4946, 863, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [1M] REAL', 'Instagram Impressions [1M] ', 100, 10000000, 16300, 8300, 'Aktif', 863, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4947, 864, 'Instagram Likes / Likes + Impressions', 'Instagram Impressions [100K] ', '  Instagram Impressions [100K] ', 10, 1000000, 18550, 10550, 'Aktif', 864, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4948, 878, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [15K] [ALL POSTS]', 'Instant Start<br>\r\n30k / Day Speed !<br>\r\nMin 100', 50, 15000, 15170, 7170, 'Aktif', 878, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4949, 881, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [MALE] [30K] ', 'Username Only<br>\r\nViews from MALE users<br>\r\n0-1 Hour Start!<br>\r\n50K/Day<br>\r\nMinimum 20', 20, 30000, 21900, 13900, 'Aktif', 881, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4950, 882, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [FEMALE] [30K] ', 'Username Only<br>\r\nViews from FEMALE users<br>\r\n0-1 Hour Start!<br>\r\n50K/Day<br>\r\nMinimum 20<br>', 20, 30000, 21900, 13900, 'Aktif', 882, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4951, 912, 'Twitter Poll Votes', 'Twitter Poll Votes [10M] !', 'Link Example: www....com?vote=ButtonNumber<br>\r\n0-1 Hour Start!<br>\r\n100K/Day<br>\r\nMinimum 100', 100, 10000000, 29600, 21600, 'Aktif', 912, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4952, 945, 'SoundCloud', 'SoundCloud Likes [1M] ', ' 	Real\r\n0-1 Hour Start!\r\n1K - 10K/Day\r\nMinimum 20', 20, 10000000, 44500, 36500, 'Aktif', 945, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4953, 955, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Story Views [LAST STORY ONLY] [ Max - 30k ] INSTANT', 'Views On The Last Story Posted Only!<br>\r\nUsername Only<br>\r\n0-1 Hour Start!<br>\r\nUltra Fast!<br>\r\nMinimum 20', 20, 30000, 17200, 9200, 'Aktif', 955, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4954, 956, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Highlights Views [ Max - 20k ] INSTANT', 'Get Instagram Highlights Views on ALL your HIGHLIGHTS!<br>\r\nAdd Username Only!<br>\r\nMin 20, Max 20k', 20, 20000, 49400, 41400, 'Aktif', 956, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4955, 957, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Auto Views + Impressions [10M] [EXPLORE - HOME - LOCATION - PROFILE] ', 'Its good for ranking!<br>\r\nMin 100<br>\r\nMaximum 1 million!', 50, 1000000, 16750, 8750, 'Aktif', 957, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4956, 958, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram - Story Views [ Superfast ] INSTANT', 'INSTANT START<br>\r\nRELIABLE SERVICE<br>\r\nFOR ALL STORY<br>\r\n50K/DAY<br>\r\nMIN 100, MAX 100K', 50, 100000, 15250, 7250, 'Aktif', 958, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4957, 1015, 'Youtube Likes / Comments /', ' Youtube - Likes [ NON DROP ] [ 100K/DAY ] [ Start 1-6hrs ]', 'Real NON DROP Likes<br>Life Time Guaranteed<br>Start 1-6hrs.<br>100k per day<br>Min 100<br>Max 100k', 100, 1000000, 370000, 362000, 'Aktif', 1015, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4958, 1087, 'Instagram Views', 'Instagram Views Real Indonesia [10K]', 'REAL INDONESIA', 100, 10000, 15500, 7500, 'Aktif', 1087, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4959, 1733, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Profile Visits / Views [20K] ', '- Insert PROFILE Link<br>- Instant Start<br>- Profile Visits HQ<br>- Min = 1000', 1000, 20000, 21200, 13200, 'Aktif', 1733, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4960, 1864, 'Spotify', 'Spotify Plays [10M] [30Days Refill]', '( Spotify Track Link only ) 60-120 Secs Play Time', 1000, 10000000, 28500, 20500, 'Aktif', 1864, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4961, 2057, 'SoundCloud', 'SoundCloud Plays [1.5M] [S1] ', '\r\nStart Time: Instant - 1 hours\r\nSpeed: 50K-100K/ day\r\nSpecs: Real\r\n', 100, 1000000, 15550, 7550, 'Aktif', 2057, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4962, 2058, 'SoundCloud', 'SoundCloud Plays [10M] [S2]', '\r\nStart Time: Instant - 12 hours\r\nSpeed: 1 to 3mil/ day\r\nSpecs: Full Link !\r\n', 5000, 1000000, 15420, 7420, 'Aktif', 2058, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4963, 2070, 'Facebook Page Likes', 'Facebook Page Likes [20K] - Refill 30Days ', 'Input link dari web, jangan dari apk<br>Instant - 1 hour (Up to 5K/ day)', 50, 20000, 180500, 172500, 'Aktif', 2070, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4964, 2134, 'Website Traffic [Targeted]', 'Indonesia Traffic from Google [10K/Day] ', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics<br>Anda dapat menggunakan bit.ly untuk melacak hasil<br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2134, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4965, 2135, 'Website Traffic [Targeted]', 'Indonesia Traffic from Quora [2K/Day] ', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2135, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4966, 2136, 'Website Traffic [Targeted]', 'Indonesia Traffic from Tumblr [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2136, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4967, 2137, 'Website Traffic [Targeted]', 'Indonesia Traffic from Pinterest [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2137, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4968, 2138, 'Website Traffic [Targeted]', 'Indonesia Traffic from Twitter [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2138, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4969, 2139, 'Website Traffic [Targeted]', 'Indonesia Traffic from Reddit [2K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2139, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4970, 2140, 'Website Traffic [Targeted]', 'Indonesia Traffic from YouTube [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2140, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4971, 2141, 'Website Traffic [Targeted]', 'Indonesia Traffic from Facebook [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2141, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4972, 2142, 'Website Traffic [Targeted]', 'Indonesia Traffic from Instagram [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2142, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4973, 2143, 'Website Traffic [Targeted]', 'Indonesia Traffic from Blogger.com [10K/Day]', '100% Real & Unique Traffic (Desktop Traffic) Didukung Google Analytics Low bounce rates 15-20%<br>Anda dapat menggunakan bit.ly untuk melacak hasil <br>\r\nTidak Ada Adegan Dewasa, Narkoba atau situs web berbahaya lainnya yang diizinkan<br>Format Tautan: URL Situs Web Lengkap', 500, 50000, 29200, 21200, 'Aktif', 2143, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4974, 2252, 'Instagram Likes', 'Instagram Likes [Max 10K] [ALWAYS INSTANT ]', 'INSTANT SLOW BUT OVERLOAD', 50, 10000, 35500, 27500, 'Aktif', 2252, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4975, 2276, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [10K] Instant [ No refill ]', 'Instant - 1 hour ( ONLY FOR FACEBOOK PAGES POSTS ) - No refill', 50, 10000, 76700, 68700, 'Aktif', 2276, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4976, 2332, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [15K] - 2K/Day [ Refill 14Days ]', 'Instant - 1 hour ( 1 - 2K/ day  ) \r\nINPUT LINK BROWSER, JANGAN LINK APK', 100, 15000, 101500, 93500, 'Aktif', 2332, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4977, 2369, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ Max - 20k ] [ NO REFILL BOT ] INSTANT', 'max 10k Per User - UP 3K/Day 1465', 100, 3000, 26800, 18800, 'Aktif', 2369, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4978, 2395, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 4K] [KHUSUS] PRIVAT FOLL [KOPI]', 'JANGAN ORDER OII', 50, 4000, 65000, 57000, 'Aktif', 2395, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4979, 2396, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 5K] [KHUSUS] PRIVAT FOLL [KOPI]', 'instant', 50, 3500, 65000, 57000, 'Aktif', 2396, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4980, 2397, 'ZPRIVAT NOTE ORDER', 'JANGAN DI ORDER YA [ 5K] [KHUSUS] PRIVAT LIKE YES [KOPI]', '000000', 50, 5000, 65000, 57000, 'Aktif', 2397, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4981, 2407, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', '  Shopee Likes Indonesia Bot [5K] Shopee Favorite / Like Produk Indonesia [KEDIP]', 'INSNANT KEDIP UP BANYAK', 50, 5000, 22500, 14500, 'Aktif', 2407, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4982, 2408, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL FOLL', '000000', 50, 4000, 65000, 57000, 'Aktif', 2408, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4983, 2409, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL LIKE', '0000', 50, 4000, 65000, 57000, 'Aktif', 2409, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4984, 2410, 'ZPRIVAT NOTE ORDER', 'PRIVAT [BOT] [4K] JANGAN ORDER YA BL VIEWS', '0000', 50, 4000, 65000, 57000, 'Aktif', 2410, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4985, 2431, 'Instagram TV', 'Instagram TV Views [5M/day] ', 'Instant start', 100, 100000000, 16950, 8950, 'Aktif', 2431, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4986, 2454, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram All Views Story [5k]', 'Instant', 100, 5000, 23300, 15300, 'Aktif', 2454, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4987, 2456, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram Last Story Max 5k', 'INSTANT', 100, 5000, 17300, 9300, 'Aktif', 2456, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4988, 2483, 'Instagram Views', 'Instagram Views  Max 60k - INSTANT Superfast', 'instant', 500, 60000, 17250, 9250, 'Aktif', 2483, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4989, 2484, 'Instagram Views', 'Instagram Views SuperFast - 500k/day', ' Start 0-6hrs ', 5000, 50000000, 16080, 8080, 'Aktif', 2484, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4990, 2511, 'Instagram TV', 'IGTV Views [100M] Instant - 500K/Day', 'Full TV Video Link Needed - INSTANT Start', 50, 100000000, 15920, 7920, 'Aktif', 2511, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4991, 2521, 'Instagram TV', 'Instagram TV Views [1M/day] Instant', 'iinstant start', 500, 10000000, 15990, 7990, 'Aktif', 2521, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4992, 2525, 'Instagram TV', 'Instagram TV Views [1M/day] [ Cheapest in market]', 'INSTANT', 500, 10000000, 15750, 7750, 'Aktif', 2525, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4993, 2546, 'Instagram Views', 'Instagram Views [500K] Instant - Fast', 'Instant ', 100, 1000000, 15699, 7699, 'Aktif', 2546, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4994, 2547, 'Instagram TV', 'IGTV Views [5M] Instant - 1Hours', 'Real Views  - Super Fast', 200, 5000000, 15850, 7850, 'Aktif', 2547, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4995, 2592, 'Instagram Views', 'Instagram Views [300k Per Day]  FAST ', 'instant ', 500, 300000, 17100, 9100, 'Aktif', 2592, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4996, 2593, 'Instagram Views', 'Instagram Views [ Max 10 Million ]  Super Fast ', 'Start 0-10 minutes (1Million/DAY)', 500, 1000000, 15701, 7701, 'Aktif', 2593, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4997, 2609, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [7K] [REFILL 7 DAYS] Instant ', '0-3 Hours  start  (2-5K/Day)', 100, 7000, 79900, 71900, 'Aktif', 2609, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4998, 2616, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Shopee Likes Indonesia NONDROP [4K] Shopee Favorite / Like Produk Indonesia [DB 2]', 'INSTANY', 100, 4000, 22000, 14000, 'Aktif', 2616, 'IRVANKEDE', 'SOSIAL MEDIA'),
(4999, 2656, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia Max 3,5K [TERMURAH ] USERNAME ONLY  [AKUN AKTIP-REAL] S3', 'SUPER INSTANT MAXIMAL 48 JAM !!! REAL ACCOUNT<br>\r\nJIKA PESANAN FOLLOWERS/LIKES INSTAGRAM AKTIF INDONESIA ERROR Harap cek akun tersebut terlebih dahulu,<br>\r\nPastikan : Input username untuk followers (tanpa @), bukan URL.HANYA USERNAME<br>\r\nTidak melakukan pembatasan usia pada akun (Restricted profile),<br>\r\nTidak di Private.<br>\r\nMaksimal pemesanan total (akumulasi) Sesuai database,', 50, 3500, 30000, 22000, 'Aktif', 2656, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5000, 2704, 'Instagram TV', 'Instagram TV Views [MAX 5M] Instant 1M/Days', 'instant', 250, 500000, 16150, 8150, 'Aktif', 2704, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5001, 2713, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia NEW [ 10K] [SUPER FAST]AUTO KEDIP', 'PERFOTO UP 10K LIKES INSTANT MAX 1X24 JAM', 50, 1000, 40000, 32000, 'Aktif', 2713, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5002, 2717, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [Max 100K] Instant', 'instant', 50, 100000, 15990, 7990, 'Aktif', 2717, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5003, 2770, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia HQ [SUPER FAST] [6K] AUTO KEDIP', 'PERFOTO UP 1K AKUN AKTIP DAN BOT CAMPURAN MnAX 2 HARI ', 100, 6000, 46000, 38000, 'Aktif', 2770, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5004, 2780, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers Real [ No Refill ] [ 2-5K/Day] - Less Drop', 'Less Drop (REAL + BOT)<br>\r\nINSTANT', 100, 5000, 53500, 45500, 'Aktif', 2780, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5005, 2800, 'Instagram TV', 'IGTV Likes [5K] INSTANT', '0-1 Hour Only 0 Real and Active Accounts', 50, 5000, 68000, 60000, 'Aktif', 2800, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5006, 2820, 'Instagram Views', ' Instagram Views ( Super Fast ) Min 100 Max 10 Million [ 1Million/ Hour]', ' Instagram Views ( Super Fast ) Min 100 Max 10 Million [ 1Million/ Hour]', 500, 10000000, 15550, 7550, 'Aktif', 2820, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5007, 2821, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Shopee Feed Like Bot Indonesia  [4K]', 'URL', 100, 4000, 20000, 12000, 'Aktif', 2821, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5008, 2822, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Shopee Feed Comment Indonesia BOT [4K] ', 'ISI SESUAI INTRUKSI<br>\r\nMAX PER INPUT KOMEN 5K', 10, 4000, 35000, 27000, 'Aktif', 2822, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5009, 2825, 'Instagram Views', 'Instagram Views + Impressions [10M] [INSTANT - 500K/Day] ', 'Instagram Views + Impressions [10M] [INSTANT - 500K/Day] ', 100, 1000000, 15700, 7700, 'Aktif', 2825, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5010, 2852, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions + Profile Visits [250K] Instant', 'Real IG Impressions + Profile Visits<br>\r\nInstant Start', 250, 15000, 26900, 18900, 'Aktif', 2852, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5011, 2853, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions + Reach [50K] Instant 50K/Day`', 'instant', 25, 50000, 15550, 7550, 'Aktif', 2853, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5012, 2854, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions + Profile Visits [100K] Instant', 'FULL PHOTO LINK ACCEPTED<br>\r\nGet Impressions on your Picture + 20% Profile Visits for your Profile to Improve Your Rank', 250, 15000, 27000, 19000, 'Aktif', 2854, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5013, 2855, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Profile Visits / Views [100K] Instant Start', 'Insert PROFILE username<br>\r\nProfile Visits HQ', 500, 100000, 19800, 11800, 'Aktif', 2855, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5014, 2861, 'Facebook Page Likes', 'Facebook Page Likes [Auto Refill - 16 Days] INSTANT', 'Auto-Refill if Likes Drop\r\n Drop Ratio: 10% but we added Auto-Refill in Backend System', 500, 5000, 110000, 102000, 'Aktif', 2861, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5015, 2871, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 2 Likes per minute - New', 'instant', 20, 5000, 49400, 41400, 'Aktif', 2871, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5016, 2872, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 5 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2872, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5017, 2873, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 10 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2873, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5018, 2874, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 25 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2874, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5019, 2875, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 50 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2875, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5020, 2876, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 75 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2876, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5021, 2877, 'Instagram Auto Likes [Per Minute] ', 'Instagram Likes - 100 Likes per minute - NEW', 'INSTANT', 20, 5000, 49400, 41400, 'Aktif', 2877, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5022, 2892, 'Telegram', 'Telegram - Post View [SERVER 1] [Last 1 Posts ] [ 150k] .', ' Super fast\r\n150K max', 100, 150000, 23000, 15000, 'Aktif', 2892, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5023, 2901, 'Tiktok Followers', 'Tik Tok - Followers - Instant start ( Min 10 and 30k ) .', '- Speed 5000 per day<br>\r\n- Avatars Followers and Likes<br>\r\n- 30 days warranty<br>\r\n- minimum 10<br>\r\n- maximum 10000<br>\r\n- instant start to 5 minute start Time<br>\r\n( Put Full Url For Example https://www.tiktok.com/@username )', 20, 30000, 111500, 103500, 'Aktif', 2901, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5024, 2902, 'Tiktok Likes', 'Tik Tok - Likes - Instant start ( Min 10 and Max 30k )', '- Speed 5000 per day<br>\r\n- Avatars Followers and Likes<br>\r\n- 30 days warranty<br>\r\n- minimum 10<br>\r\n- maximum 10000<br>\r\n- instant start to 5 minute start Time', 20, 30000, 111500, 103500, 'Aktif', 2902, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5025, 2903, 'Tiktok Followers', 'TIK TOK FOLLOWERS - MIN 10 - MAX 15K - 30 days refill - Full URL ', 'Input link akun bukan username<br>\r\n30 days refill<br>\r\nSpeed 2-5k/Day', 15, 20000, 133000, 125000, 'Aktif', 2903, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5026, 2906, 'Twitter Views / Impressions / Live / Comments', ' Twitter Views [1M]..', 'Instant Start\r\n500-3,000/day speed\r\n\r\nNo Refill / No refund', 100, 1000000, 41500, 33500, 'Aktif', 2906, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5027, 2907, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impressions [1M] ...', 'Twitter Impressions [1M] ', 100, 10000, 41500, 33500, 'Aktif', 2907, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5028, 2908, 'Twitter Views / Impressions / Live / Comments', ' Twitter Polls Fast Speed ( Min 20 / Max 200k Per day l).', ' Twitter Polls Fast Speed ( Min 20 / Max 200k Per day l)', 20, 20000, 53000, 45000, 'Aktif', 2908, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5029, 2909, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ Max 5m ] ,', 'Twitter Video Views [ Max 5m ] ', 100, 5200000, 25500, 17500, 'Aktif', 2909, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5030, 2910, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impression [ Max 5m ] ..', 'Twitter Impression [ Max 5m ] ', 100, 5000000, 25500, 17500, 'Aktif', 2910, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5031, 2911, 'Twitter Views / Impressions / Live / Comments', 'Twitter Profile Click [ Max 10k ] ,', 'Twitter Profile Click [ Max 10k ] ', 100, 1000000, 25500, 17500, 'Aktif', 2911, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5032, 2912, 'Twitter Views / Impressions / Live / Comments', 'Twitter Hashtag Click [ Max 10k ]/', 'Twitter Hashtag Click [ Max 10k ] ', 100, 1000000, 25500, 17500, 'Aktif', 2912, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5033, 2913, 'Twitter Views / Impressions / Live / Comments', 'Twitter Link Click [ Max 10k ] .', 'Twitter Link Click [ Max 10k ] ', 100, 1000000, 25500, 17500, 'Aktif', 2913, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5034, 2914, 'Twitter Views / Impressions / Live / Comments', 'Twitter Polls Slow Speed ( Min 20 / Max 50k ) .', 'Twitter Polls Slow Speed ( Min 20 / Max 50k ) ', 20, 10000000, 24800, 16800, 'Aktif', 2914, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5035, 2926, 'Instagram Likes', 'Instagram Likes 100% Real Account [ Country - Turkey + Asia+ Indonesia]', ' 1k-2k/houR turkey- asia targeted', 50, 40000, 26500, 18500, 'Aktif', 2926, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5036, 2932, 'Youtube Likes / Comments /', 'Youtube Likes [ Max 50K ] No Refill Instant', 'Real Likes\r\nNO REFILL NO Refund\r\n', 20, 50000, 57500, 49500, 'Aktif', 2932, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5037, 2945, 'Tiktok Likes', 'Tiktok Likes [ Max 10k ] - 1k-5k/day', 'No Refill<br>\r\n1k-5k/day<br>\r\nReal Looking', 100, 10000, 38900, 30900, 'Aktif', 2945, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5038, 2950, 'Instagram Likes', 'Instagram Likes [ Real ] [30 Days Guarantee ] - Instant`', '30 days guarantee\r\n100% real likes\r\n', 50, 5000, 59900, 51900, 'Aktif', 2950, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5039, 2976, 'Instagram Likes', 'Instagram Likes [ Max 50K ] instant Real', 'with profile picture\r\ninstant', 20, 50000, 30800, 22800, 'Aktif', 2976, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5040, 2980, 'Youtube Likes / Comments /', 'Youtube Likes [ Max 5k ] Instant - No Refill ', 'Real Youtube Likes\r\nInstant Start\r\nNo Refill | No Refund', 100, 5000, 44600, 36600, 'Aktif', 2980, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5041, 2982, 'Instagram Likes', 'Instagram Likes [Max 5k] Real 100% Indian + Arab - Country', 'No refill Indian and Arab User', 20, 5000, 25300, 17300, 'Aktif', 2982, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5042, 2985, 'Instagram Live Video', 'Instagram Live Video Likes [10K] [INSTANT - INSTANT]', 'Username Only<br>\r\nNo Refill / No Refund<br>\r\nLikes On Live Video<br>\r\nFast Delivery<br>\r\nMinimum 200', 200, 10000, 18900, 10900, 'Aktif', 2985, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5043, 2987, 'Facebook Followers / Friends / Group Members', 'Facebook Profile Followers [1K] [INSTANT - INSTANT] ', 'no refill<br>\r\nEXAMPLE LINK : https://www.facebook.com/solusimediaid/', 20, 1000, 84000, 76000, 'Aktif', 2987, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5044, 3011, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ MAX 20K ] INSTANT', 'INSTANT', 100, 20000, 18700, 10700, 'Aktif', 3011, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5045, 3013, 'TikTok  Views, Komentar , Like Komentar &Share', 'TIKTOK Shares - Real ', 'Drop hingga 20-40%<br>\r\nAll Real Profile', 100, 10000, 73000, 65000, 'Aktif', 3013, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5046, 3035, 'Instagram Likes', 'Instagram Likes [ MAX 50K ] No Refill - INSTANT', 'Real Likes and Real Account Instant Start !', 20, 50000, 24900, 16900, 'Aktif', 3035, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5047, 3046, 'Instagram Views', 'Instagram Views + Impressions [RANDOM] - MAX 5 Million ', 'INSTANT', 100, 50000000, 16150, 8150, 'Aktif', 3046, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5048, 3052, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia Aktip Max 500/Akun [JAMINAN TERMURAH ] USERNAME ONLY', 'INPUT WAJIB USERNAME KALO BUKAN USERNAME ERROR SUPER INSTANT MAXIMAL 48 JAM !!! REAL ACCOUNT  TERKADANG PARTIAL SERVER TIDAK STABIL OFF JIKA OVERLOAD', 100, 500, 24000, 16000, 'Aktif', 3052, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5049, 3069, 'Instagram Views', 'Instagram Views [ 10M/DAY ] SUPER FAST', 'INSTANT', 200, 10000000, 15590, 7590, 'Aktif', 3069, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5050, 3074, 'Instagram TV', 'Instagram TV Views [ 3M/DAY ] INSTANT', 'INSTANT FAST', 100, 10000000, 15650, 7650, 'Aktif', 3074, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5051, 3080, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions [ MAX 10K ] ', 'INSTANT\r\nNO REFILL - NO REFUND', 100, 10000, 15860, 7860, 'Aktif', 3080, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5052, 3088, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impressions - Max 100K  [ INSTANT ]', 'INSTANT', 5, 100000, 18700, 10700, 'Aktif', 3088, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5053, 3096, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Followers Shopee NON DROP !!! [2K] INSTANT ] [ DB FRESS ] NEW', 'INPUT USERNAME ONLY', 100, 2000, 38000, 30000, 'Aktif', 3096, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5054, 3101, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ 50K/Day ] ', 'instant', 100, 100000, 17700, 9700, 'Aktif', 3101, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5055, 3102, 'Twitter Views / Impressions / Live / Comments', 'Twitter Impression [ Max 10K ]  Instant Start', 'INSTANT', 10, 10000, 26300, 18300, 'Aktif', 3102, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5056, 3128, 'Youtube Likes / Comments /', 'Youtube Real Likes  [ MIN 100 ]', 'Lifetime Guarantee\r\nSuper Fast and Instant Start', 100, 100000, 145000, 137000, 'Aktif', 3128, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5057, 3130, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia NEW [ MIN 100 ] [MAX 20K ] NEW DATABASE  [AKUN AKTIP-REAL] S4', 'no refill username only  JIKA PESANAN FOLLOWERS/LIKES INSTAGRAM AKTIF INDONESIA ERROR Harap cek akun tersebut terlebih dahulu, pastikan nTidak private akun Input username untuk followers (tanpa @), bukan URL.HANYA USERNAME !!! Tidak melakukan pembatasan usia pada akun (Restricted profile).Maksimal pemesanan total (akumulasi) Sesuai database,', 100, 20000, 43000, 35000, 'Aktif', 3130, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5058, 3170, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 50K [ No Refill ] ', 'INSTANT', 100, 50000, 35600, 27600, 'Aktif', 3170, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5059, 3173, 'TikTok  Views, Komentar , Like Komentar &Share', 'TikTok Video Views [ 30-50K/DAY ] Exclusive Service', 'KHUSUS LAYANAN INI MEMBANTU VIDEO ANDA TRENDING DAN VIRAL<br>\r\nINSTANT', 500, 500000, 16900, 8900, 'Aktif', 3173, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5060, 3181, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 3K [ REAL - LESS DROP ] NO REFILL', 'INSTANT', 100, 3000, 58700, 50700, 'Aktif', 3181, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5061, 3183, 'Instagram Likes', 'Instagram Likes [ 300-500/hour ] REAL - NO REFILL', 'INSTANT', 50, 10000, 24500, 16500, 'Aktif', 3183, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5062, 3186, 'Instagram Likes', 'Instagram Likes + Impressions  [ MAX 30K ] INSTANT', 'INSTANT', 10, 30000, 29400, 21400, 'Aktif', 3186, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5063, 3190, 'Instagram Likes', 'Instagram Likes [ MAX 20K ] INSTANT - NOREFILL', 'NO REFILL - NO REFUND 160', 10, 100000, 23400, 15400, 'Aktif', 3190, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5064, 3195, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [15K] INSTANT - MIX BOT', 'NO REFILL - NOREFUND\r\n', 100, 50000, 35500, 27500, 'Aktif', 3195, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5065, 3196, 'Instagram Likes', 'instagram Likes - Max 20k ~ BOT ~ Speed 5k/hrs ~ INSTANT .', ' No Refill Speed 1-2K/ Per Day Likes Can Drop Cheapest Service 160', 100, 20000, 23000, 15000, 'Aktif', 3196, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5066, 3199, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 50K [ NO REFILL - INSTANT ]', 'Speed 10K/Day NO REFILL', 10, 50000, 25500, 17500, 'Aktif', 3199, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5067, 3215, 'Instagram Likes', 'Instagram Likes [ 1K/HOURS ] REAL - INSTANT', 'Drop 0-5% ( ESTIMASI )<br>\r\nINSTAN`', 10, 10000, 41500, 33500, 'Aktif', 3215, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5068, 3216, 'Instagram Likes', 'Instagram Likes - 100% [ Country Turkey + Asia ] INSTANT', '100-200/hour turkey- asia targeted', 10, 50000, 24400, 16400, 'Aktif', 3216, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5069, 3217, 'Telegram', 'Telegram Public Channel Members [ MAX 200K ] No Refill', 'Speed-20k/day\r\nINSTANT', 1000, 200000, 42100, 34100, 'Aktif', 3217, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5070, 3221, 'Twitter Likes', 'Twitter Likes - MAX 5K [ INSTANT ]', 'No Refill\r\n`', 10, 5000, 33900, 25900, 'Aktif', 3221, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5071, 3255, 'Instagram Likes', 'Instagram Likes [ Max 15K ] INSTANT - NO REFILL ', 'No RefillnnSpeed 1-2K/ Per Day', 20, 15000, 22000, 14000, 'Aktif', 3255, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5072, 3261, 'Telegram', 'Telegram Public Group Members [ 10K/Day ] Real', 'No Refill\r\nStart instant\r\n', 100, 10000, 39900, 31900, 'Aktif', 3261, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5073, 3262, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [7K] [BEST SELLER] [REAL] [BETA] ', '2X24 JAM NO REFILL', 100, 7000, 37000, 29000, 'Aktif', 3262, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5074, 3274, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [INSTANT] REAL ACCOUNT FAST 25K', 'NO REFILL NO REFUND MAXIMAL 2 HARI LANCAR KEDIP JIKA ANTRIAN KOSONG', 100, 25000, 50500, 42500, 'Aktif', 3274, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5075, 3288, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ 1K-3K/DAY ] MAX 5K - REFILL 30DAYS', 'Start Instant\r\n', 100, 5000, 40900, 32900, 'Aktif', 3288, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5076, 3297, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Love React â¤ï¸ ]', 'instant', 50, 5000, 45300, 37300, 'Aktif', 3297, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5077, 3298, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Angry React ]', 'instant', 50, 5000, 45300, 37300, 'Aktif', 3298, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5078, 3299, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Haha React ] ', 'INSTANT', 50, 5000, 45300, 37300, 'Aktif', 3299, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5079, 3300, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ WoW React ] ', 'INSTANT', 50, 5000, 45300, 37300, 'Aktif', 3300, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5080, 3301, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Sad React ] ', 'INSTANT', 50, 5000, 45300, 37300, 'Aktif', 3301, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5081, 3302, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Emoticon Like [ Care React ] ', 'instant', 50, 5000, 45300, 37300, 'Aktif', 3302, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5082, 3308, 'Instagram Likes', 'Instagram Likes Real - MAX 10K [ REFILL 365 DAYS ] ', 'INSTANT', 100, 10000, 62200, 54200, 'Aktif', 3308, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5083, 3355, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok  Likes Indonesia [1K] [ACCOUNT INDONESIA] [NON DROP]', 'INPUT LINK AKUN BOT INDONESIA , BOT YA PROSES INSTANT JIKA ANTRIAN TIDAK BANYAK MAX PROSES -12 HARI PROSES AKUN BOT INDONESIA', 100, 1000, 50000, 42000, 'Aktif', 3355, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5084, 3356, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok  Views Indonesia [1K] [ACCOUNT INDONESIA] [NONDROP]', 'INPUT LINK BOT AKUN INDONESIA - NONDROP - PROSES INSTANT TAPI KALO RAME PROSES MAX 1-2 HARI ', 100, 1000, 22000, 14000, 'Aktif', 3356, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5085, 3381, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 1K NEW', 'INSTANT', 1000, 1000, 70000, 62000, 'Aktif', 3381, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5086, 3382, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 2K NEW', 'INSTANT', 2000, 2000, 70000, 62000, 'Aktif', 3382, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5087, 3383, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 3K NEW', 'INSTANT', 3000, 3000, 70000, 62000, 'Aktif', 3383, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5088, 3384, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 4K NEW ', 'INSTANT', 4000, 4000, 70000, 62000, 'Aktif', 3384, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5089, 3385, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 5K NEW ', 'INSTANT', 5000, 5000, 70000, 62000, 'Aktif', 3385, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5090, 3386, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 6K NEW ', 'INSTANT', 6000, 6000, 70000, 62000, 'Aktif', 3386, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5091, 3387, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 7K NEW ', 'INSTANT', 7000, 7000, 70000, 62000, 'Aktif', 3387, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5092, 3388, 'Instagram Followers Indonesia PAKET REAL ', 'FOLLOWERS INDO PAKET 8K NEW', 'INSTANT', 8000, 8000, 70000, 62000, 'Aktif', 3388, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5093, 3397, 'Youtube Views', 'Youtube Views [ 20K-50K ] REFILL 30DAYS', 'INSTANT', 100, 100000000, 44300, 36300, 'Aktif', 3397, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5094, 3418, 'Instagram Likes', 'Instagram Likes - MAX 5K [ HQ ASIAN ] ', 'REAL ASIAN\r\nSpeed 1k-3k/day', 50, 5000, 35400, 27400, 'Aktif', 3418, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5095, 3420, 'Instagram Followers Indonesia', 'Instagram Followers Indonesia [25K] [BEST SELLER] [REAL]', 'REAL AKTIP INDONESIA MAX PROSES 1-3 HARI TERGANTUNG ANTRIAN DALAM LAYANAN YA ', 100, 25000, 49000, 41000, 'Aktif', 3420, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5096, 3421, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [10K] [BEST SELLER] [REAL] [BETA] ', 'REAL AKTIP ACCOUNT PROSES MAX 3 HARI', 100, 10000, 30800, 22800, 'Aktif', 3421, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5097, 3423, 'Instagram Likes', 'Instagram Likes - MAX 5K [ REAL - HQ ] ', '1k-3k/day\r\nASIAL PROFILE', 50, 5000, 34600, 26600, 'Aktif', 3423, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5098, 3427, 'Youtube Views', 'Youtube Views [ 5K-10K/DAYS ] Lifetime Guarantee', 'Retention - 2-5 minutes ( JIKA DAPAT )\r\nEmergency Server\r\n', 1000, 10000000, 59500, 51500, 'Aktif', 3427, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5099, 3431, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Photo Likes - MAX 5K  [ REFILL 30DAYS ] ', 'Instant Start\r\nMIX Likes\r\n', 50, 5000, 29900, 21900, 'Aktif', 3431, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5100, 3438, 'Instagram Likes Indonesia', 'Instagram Likes Indonesia [10K] [BEST SELLER] [REAL] SUPER FAST ', 'NO REFILL NO REFUND FAST', 100, 10000, 28000, 20000, 'Aktif', 3438, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5101, 3439, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK SHARE INDONESIA FYP [20K] INSTANT REAL DB INDONESIA', 'CONTOH LINK YANG DI INPUT WAJIB BIAR GAK EROR  https://www.tiktok.com/@eca.btari/video/6908217883042548994 ', 100, 20000, 50000, 42000, 'Aktif', 3439, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5102, 3440, 'Youtube Views', 'Youtube Views - 5K/DAY [ 30 Days Guaranted ] INSTANT', 'REFILL 30DAYS', 1000, 500000, 38300, 30300, 'Aktif', 3440, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5103, 3453, 'Instagram Likes', 'Instagram Likes - MAX 5K [ INSTANT - START ]', 'NO REFILL 300-500/hour 796', 10, 5000, 25200, 17200, 'Aktif', 3453, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5104, 3460, 'Instagram Likes Indonesia', 'Likes Indonesia FAST PROSES [15K] [REAL]', 'PROSES INSTANT ', 50, 15000, 38000, 30000, 'Aktif', 3460, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5105, 3463, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram Followers Indonesia AUTO REFILL 7 HARI [10K]', 'AUTO REFILL - JIKA MASA DURASI HABIS TIDAK ADA REFILL LAGI ', 100, 10000, 70000, 62000, 'Aktif', 3463, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5106, 3464, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram FOLLOWERS AUTO REFILL 15 DAYS [10K]', 'AUTO REFILL , JIKA MASA DURASI HABIS TIDAK ADA REFILL LAGI', 100, 10000, 80000, 72000, 'Aktif', 3464, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5107, 3465, 'Instagram Followers Indonesia [Bergaransi] Refill ', 'Instagram FOLLOWERS AUTO REFILL 30 DAYS [10K]', 'AUTO REFILL', 100, 10000, 93000, 85000, 'Aktif', 3465, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5108, 3466, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views [ 100K-200K/DAY ] ', 'INSTANT', 100, 10000000, 17150, 9150, 'Aktif', 3466, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5109, 3471, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 2K-4K/DAY ] INSTANT - NOREFILL ', 'INSTANT nCAN HIGH DROP', 10, 10000, 21500, 13500, 'Aktif', 3471, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5110, 3476, 'Telegram', 'Telegram Channel/Group Members - MAX 50K [ INSTANT - FAST ] ', 'Only OPEN Channels/Groups\r\nFull link - https://t.me/yourchannel', 500, 50000, 38300, 30300, 'Aktif', 3476, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5111, 3479, 'Telegram', 'Telegram Channel/Group Members USA - MAX 15K [ INSTANT ] ', 'Only OPEN Channels/Groups\r\nFull link - https://t.me/yourchannel', 500, 15000, 38300, 30300, 'Aktif', 3479, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5112, 3480, 'Telegram', 'Telegram Channel/Group Members [ MAX 20K - NO REFILL ] ', 'Only OPEN Channels/Groups\r\nFull link - https://t.me/yourchannel', 100, 20000, 32200, 24200, 'Aktif', 3480, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5113, 3483, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views [ All Story] - MAX 50K', 'USERNAME ONLY', 100, 50000, 16200, 8200, 'Aktif', 3483, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5114, 3485, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK SHARE INDONESIA [100K] FAST INSTANT TERMURAH', 'CONTOH LINK YANG DI INPUT WAJIB BIAR GAK EROR  https://www.tiktok.com/@eca.btari/video/6908217883042548994 ', 100, 100000, 26000, 18000, 'Aktif', 3485, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5115, 3492, 'Instagram Likes', 'Instagram likes - Turkey TARGETTED [ MAX 20K ] ', 'INSTANT', 20, 20000, 40900, 32900, 'Aktif', 3492, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5116, 3493, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Profile Visits - INSTANT', 'USERNAME ONLY', 100, 5000000, 15850, 7850, 'Aktif', 3493, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5117, 3495, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impression [ 10K/DAY ] [ NEW ]', 'INSTANT', 100, 5000000, 15460, 7460, 'Aktif', 3495, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5118, 3501, 'Twitter Views / Impressions / Live / Comments', 'Twitter Views - INSTANT', 'Targeted Arabia ', 10, 1000000, 16554, 8554, 'Aktif', 3501, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5119, 3504, 'Instagram Likes', 'Instagram Likes - MAX 10K [ NO REFILL ] ', 'INSTANT CAN HIGH DROP', 10, 10000, 18600, 10600, 'Aktif', 3504, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5120, 3506, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ NO REFILL ]', 'INSTANT CAN HIGH DROP 3403', 10, 10000, 19400, 11400, 'Aktif', 3506, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5121, 3510, 'Instagram Views', 'Instagram Views - MAX 5M [ INSTANT - Recommended ]', 'INSTANT', 100, 50000000, 15520, 7520, 'Aktif', 3510, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5122, 3511, 'Instagram Views', 'Instagram Views - MAX 10M [ INSTANT FAST ] ', 'Start 0-10 minute', 100, 10000000, 15200, 7200, 'Aktif', 3511, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5123, 3512, 'Spotify', 'Spotify User Followers - INSTANT [ NO REFILL ] ', 'Bot Accounts\r\nNo Guarantee - Even If drop next day\r\n', 100, 500000, 20000, 12000, 'Aktif', 3512, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5124, 3513, 'Spotify', 'Spotify PlayList Followers - INSTANT [ NO REFILL ] ', 'Bot Accounts<br>\r\nNo Guarantee - Even If drop next day', 500, 500000, 20000, 12000, 'Aktif', 3513, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5125, 3514, 'Spotify', 'Spotify - Plays [ CEK NOTE ] ', 'Correct format: https://open.spotify.com/track/40Zb4FZ6nS1Hj8RVfaLkCV\r\nDon\'t Order Album Link\r\n if your track remove, we will not refund or refill', 1000, 100000000, 29500, 21500, 'Aktif', 3514, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5126, 3515, 'Spotify', 'Spotify - Plays [ CEK NOTE ] S2', 'Correct format: https://open.spotify.com/track/40Zb4FZ6nS1Hj8RVfaLkCV\r\nDon\'t Order Album Link\r\nif your track remove, we will not refund or refill', 1000, 1000000000, 31500, 23500, 'Aktif', 3515, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5127, 3516, 'Spotify', 'SPOTIFY PLAYS - MAX 100K', 'Spotify Plays\r\nTracks + Albums', 1000, 1000000, 30600, 22600, 'Aktif', 3516, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5128, 3517, 'Spotify', 'Spotify Followers - INSTANT', 'LINK PROFIL ONLY', 20, 100000, 40700, 32700, 'Aktif', 3517, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5129, 3524, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram - Followers Max 10k  BOT NO REFILL~ 0-2Hrs  [ INSTANT]', 'NO REFILL NO REFUND', 50, 10000, 17700, 9700, 'Aktif', 3524, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5130, 3526, 'Instagram Likes', 'Instagram Likes - 10K/DAY [ NO REFILL ] ', 'INSTANT CAN HIGH DROP', 10, 10000, 17200, 9200, 'Aktif', 3526, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5131, 3527, 'Instagram Likes', 'Instagram Likes [ MAX 10K - NOREFILL ] INSTANT', 'INSTANT CAN HIGH DROP 63', 10, 10000, 19300, 11300, 'Aktif', 3527, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5132, 3532, 'Facebook Page Likes', 'Facebook Page Followers [ REFILL 30DAYS ] ', 'link profil only from website\r\n', 100, 50000, 97000, 89000, 'Aktif', 3532, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5133, 3533, 'Facebook Followers / Friends / Group Members', 'Facebook Profile Followers [ REFILL 30DAYS ] ', 'LINK PROFIL ONLY FROM WEBSITE', 100, 3000, 97000, 89000, 'Aktif', 3533, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5134, 3534, 'Facebook Page Likes', 'Facebook Page Likes - HQ INSTANT [ 30DAYS REFILL ] ', 'LINK PROFIL ONLY ', 100, 25000, 190000, 182000, 'Aktif', 3534, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5135, 3535, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - MAX 25K [ REFILL 30DAYS ] ', 'REAL MIX\r\nINSTANT', 50, 25000, 74800, 66800, 'Aktif', 3535, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5136, 3536, 'Telegram', 'Telegram Group Members [ MAX 10K ] ', 'Only For Group\r\nNo Activity\r\nExample link: https://t.me/joinchat/Imy-SxcbZE7tAepynRhpew', 100, 10000, 83000, 75000, 'Aktif', 3536, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5137, 3537, 'Instagram Likes', 'Instagram Likes - MAX 3K [ NO REFILL - INSTANT ] ', 'INSTANT\r\nCAN HIGH DROP', 20, 3000, 20800, 12800, 'Aktif', 3537, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5138, 3539, 'Twitter Views / Impressions / Live / Comments', 'Twitter Video Views - Max 100m [ Recommended ]', 'instant', 100, 100000000, 16600, 8600, 'Aktif', 3539, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5139, 3540, 'Tiktok Likes', 'TikTok Likes [ MAX 10K ] INSTANT', 'INSTANT', 15, 5000, 140000, 132000, 'Aktif', 3540, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5140, 3541, 'Tiktok Likes', 'TikTok Likes [ ADD VIDEO LINK ] MAX 20K', 'URL/Link Video lengkap', 15, 20000, 146000, 138000, 'Aktif', 3541, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5141, 3542, 'Tiktok Likes', 'Tiktok Likes Real - 1K/DAY [ INSTAN ] ', 'Likes are 100% real\\r\\n', 100, 10000, 88000, 80000, 'Aktif', 3542, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5142, 3544, 'Youtube Likes / Comments /', 'Youtube Likes - Best Service [ MAX 7K ] ', 'INSTANT', 100, 7000, 223000, 215000, 'Aktif', 3544, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5143, 3545, 'Youtube Likes / Comments /', 'Youtube Video Custom Comments - INSTANT', 'Youtube Video Global Comment `\\r\\n', 5, 6000, 150300, 142300, 'Aktif', 3545, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5144, 3546, 'Youtube Views', 'Youtube Views [ MAX 30K ] Lifetime Guarantee', 'Retention 30 second to 5 minutes ( JIKA DAPAT  )', 1000, 300000, 40300, 32300, 'Aktif', 3546, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5145, 3547, 'Youtube Live Stream', 'Youtube Live Stream Views [ MAX 100K ] NO REFILL', '100% Real Human YouTube Users Viewers\\\r\nWorld-Wide Viewers\r\nMust be Unrestricted & Open for ALL countries\r\nOnly embed enabled videos allowed\r\n', 1000, 100000, 78000, 70000, 'Aktif', 3547, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5146, 3561, 'Instagram Live Video', 'Instagram Live Video Views - MAX 20K ', 'HQ Accounts\r\nALWAYS WORKING SERVICE\r\n', 20, 20000, 245000, 237000, 'Aktif', 3561, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5147, 3562, 'Instagram Live Video', 'Instagram Live Video View - MAX 5K', 'Username Only\r\nNo Refill / No Refund\r\nViews On Live Video\r\n', 100, 5000, 206000, 198000, 'Aktif', 3562, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5148, 3563, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Poll Votes [ MAX 30K ] ', 'Link Example for Option 1: USERNAME?vote=1\r\nLink Example for Option 2: USERNAME?vote=2', 20, 30000, 111000, 103000, 'Aktif', 3563, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5149, 3564, 'Spotify', 'Spotify FRANCE Followers [ MAX 100K ] ', 'LINK ONLY', 100, 100000, 76100, 68100, 'Aktif', 3564, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5150, 3565, 'Spotify', 'Spotify FRANCE Followers [PLAYLIST] - MAX 100K', ' LINK ONLY\r\nhttps://anon.ws/?https://open.spotify.com/playlist/', 100, 5000, 76100, 68100, 'Aktif', 3565, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5151, 3568, 'Youtube Likes / Comments /', 'Youtube Likes [ MAX 100K ]  NO REFILL', ' NO REFILL - NO REFUND', 20, 100000, 41600, 33600, 'Aktif', 3568, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5152, 3569, 'Youtube Live Stream', 'Youtube Live Stream Views [ INSTANT ] ', '100% Real Human YouTube Users Viewers!\r\n100% Unique Traffic can be monetize\r\nRandom Retention\r\nviews can be send to embed disabled livestream videos', 1000, 100000, 79500, 71500, 'Aktif', 3569, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5153, 3570, 'Youtube Views', 'Youtube Views - MAX 100M [ REFILL 30DAYS ]', ' Retention 20-40 Second ( JIKA DAPAT )\r\n', 1000, 100000000, 42600, 34600, 'Aktif', 3570, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5154, 3572, 'Youtube Views', 'Youtube Views [ 20-40K/DAY ] INSTANT', 'Will show up in WATCH TIME analytics\r\nRetention random', 500, 1000000, 58000, 50000, 'Aktif', 3572, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5155, 3573, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Photo Likes - MAX 2K [ REFILL 30DAYS ]', 'INSTANT', 50, 2000, 45600, 37600, 'Aktif', 3573, 'IRVANKEDE', 'SOSIAL MEDIA');
INSERT INTO `layanan_sosmed` (`id`, `service_id`, `kategori`, `layanan`, `catatan`, `min`, `max`, `harga`, `harga_api`, `status`, `provider_id`, `provider`, `tipe`) VALUES
(5156, 3574, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [ MAX 10K ] INSTANT START', 'No refill\r\n\r\n', 25, 10000, 68400, 60400, 'Aktif', 3574, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5157, 3575, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes [ MAX 10K ] REFILL 30DAYS', 'INSTANT', 20, 1000, 29000, 21000, 'Aktif', 3575, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5158, 3576, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Likes - MAX 50K [ REFILL 30DAYS ] ', 'INSTANT\r\nRecommended', 50, 50000, 65500, 57500, 'Aktif', 3576, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5159, 3577, 'Facebook Video Views / Live Stream', 'Facebook Video Views [ 20k-50k/Day ] ', 'INSTANT', 5000, 1000000000, 23700, 15700, 'Aktif', 3577, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5160, 3578, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ REAL MIX ] MAX 15K - REFILL 30DAYS', 'INSTANT', 50, 15000, 66800, 58800, 'Aktif', 3578, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5161, 3579, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - 1K/DAY [ REFILL 30DAYS ] INSTANT', 'Instant\r\nHigh Quality\r\n', 10, 85000, 54800, 46800, 'Aktif', 3579, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5162, 3580, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ 3K/DAY ] REFILL 180DAYS', 'INSTANT', 100, 20000, 62800, 54800, 'Aktif', 3580, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5163, 3581, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ MAX 15K ] REFILL 30DAYS', 'INSTANT', 50, 10000, 48500, 40500, 'Aktif', 3581, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5164, 3582, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ 1K-3K/DAY ] REFILL 3ODAYS', 'INSTANT', 10, 50000, 43800, 35800, 'Aktif', 3582, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5165, 3583, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ MAX 50K ] REFILL 90DAYS', '1K-2K/day', 10, 500000, 42500, 34500, 'Aktif', 3583, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5166, 3584, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ 2K-3K/DAY ] REFILL 30DAYS', 'Real LQ\r\nINSTANT', 50, 5000, 61000, 53000, 'Aktif', 3584, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5167, 3585, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - 500/DAY [ REFILL 30DAYS ]', 'Real Mixed\r\nINSTANT', 50, 50000, 69700, 61700, 'Aktif', 3585, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5168, 3586, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - MAX 100K [ REFILL 30DAYS ] ', 'High Quality<br>\r\n2k - 3k/DAY', 25, 100000, 48100, 40100, 'Aktif', 3586, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5169, 3587, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - MAX 100K [ REFILL 30DAYS ] HQ', '1k - 2k Per Day Speed\r\nHigh Quality\r\n', 20, 100000, 47100, 39100, 'Aktif', 3587, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5170, 3589, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 10K [ REAL MIX ] NOREFILL', '10k/day\r\nNo refill\r\n', 5, 20000, 35200, 27200, 'Aktif', 3589, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5171, 3590, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 3K [ HQ - NO REFILL ]', 'INSTANT\r\nReal majority\r\n', 50, 2000, 34200, 26200, 'Aktif', 3590, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5172, 3591, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - 10K/DAY [ REAL MIX ] NO REFILL', 'Start Instant\r\n', 100, 10000, 38000, 30000, 'Aktif', 3591, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5173, 3592, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 10K ] INSTANT - NOREFILL', 'INSTANT SERVICE', 50, 10000, 36100, 28100, 'Aktif', 3592, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5174, 3594, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 1K [ NO REFILL ] ', 'INSTANT', 100, 1000, 32200, 24200, 'Aktif', 3594, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5175, 3595, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ MAX 5K ] REAL - INSTANT', 'INSTANT', 100, 5000, 45800, 37800, 'Aktif', 3595, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5176, 3596, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Reach + Impressions [ INSTANT ]', 'INSTANT', 100, 5000000, 15820, 7820, 'Aktif', 3596, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5177, 3597, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Reach + Impressions + Profile Visit [ NEW ] ', 'INSTANT', 100, 5000000, 16300, 8300, 'Aktif', 3597, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5178, 3598, 'Instagram Likes', 'Instagram Likes [ INDIAN ] 5K/DAY', 'INSTANT', 10, 10000, 39900, 31900, 'Aktif', 3598, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5179, 3599, 'Instagram Likes', 'Instagram Likes - MAX 2K [ INSTANT - REAL ]', 'Real Likes', 50, 2000, 34200, 26200, 'Aktif', 3599, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5180, 3601, 'Instagram Likes', 'Instagram Likes [ MAX 30K ] INSTANT', 'Real Likes ', 50, 30000, 32300, 24300, 'Aktif', 3601, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5181, 3602, 'Instagram Likes', 'Instagram Likes - MAX 5K [ INSTANT - NOREFILL ] ', 'Real accounts\r\nAll accounts have profile pictures\r\n', 20, 5000, 29400, 21400, 'Aktif', 3602, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5182, 3603, 'Instagram Likes', 'Instagram Likes [ MAX 10K ] REAL - INSTANT', 'Instant Start\r\nDaily 5000 Likes Per Day\r\n100% Real Likes\r\n', 20, 10000, 40000, 32000, 'Aktif', 3603, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5183, 3604, 'Instagram Likes', 'Instagram Likes - MAX 20K [ NO REFILL ]', 'INSTANT', 50, 20000, 32300, 24300, 'Aktif', 3604, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5184, 3605, 'Instagram Likes', 'Instagram Likes - MAX 2K [ REAL - HQ ]', 'INSTANT', 100, 2000, 33400, 25400, 'Aktif', 3605, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5185, 3606, 'Instagram Likes', 'Instagram Likes - MAX 3K [ Recommended ]', 'Real Users\r\n', 50, 3000, 34200, 26200, 'Aktif', 3606, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5186, 3607, 'Instagram Likes', 'Instagram Likes [ MAX 30K ] REAL - INSTANT', 'INSTANT', 20, 10000, 27700, 19700, 'Aktif', 3607, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5187, 3610, 'Telegram', 'Telegram Post View - Last 10 Posts ', 'INSTANT', 100, 35000, 20900, 12900, 'Aktif', 3610, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5188, 3611, 'Telegram', 'Telegram Post View - Last 20 Posts', 'INSTANT', 100, 35000, 26700, 18700, 'Aktif', 3611, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5189, 3612, 'Telegram', 'Telegram Post View - Last 5 Posts', 'INSTANT', 100, 35000, 18100, 10100, 'Aktif', 3612, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5190, 3613, 'Telegram', 'Telegram Channel Members - MAX 20K [ NO REFILL ]', 'INSTANT', 1000, 20000, 44800, 36800, 'Aktif', 3613, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5191, 3614, 'Telegram', 'Telegram Channel Members - MAX 10K [ NO REFILL ] ', 'Real Members\r\nNo Refill\r\n', 1000, 10000, 40000, 32000, 'Aktif', 3614, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5192, 3616, 'Tiktok Followers', 'TikTok Followers - MAX 10K [ ADD VIDEO LINK ]', 'INSTANT\r\nVideo link accepted\r\n', 100, 10000, 63000, 55000, 'Aktif', 3616, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5193, 3617, 'Tiktok Followers', 'Tiktok Followers [ 3k-5k/DAY ] INSTANT', 'LINK PROFIL ONLY', 100, 10000, 61000, 53000, 'Aktif', 3617, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5194, 3619, 'Tiktok Likes', 'Tiktok Likes - MAX 5K [ INSTANT - 1K/HOURS ] ', 'INSTANT', 10, 5000, 32250, 24250, 'Aktif', 3619, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5195, 3620, 'Tiktok Likes', 'Tiktok Likes [ MAX 3K ] NO REFILL', 'INSTANT', 100, 3000, 30400, 22400, 'Aktif', 3620, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5196, 3621, 'Tiktok Likes', 'TikTok Likes - 5K/DAY [ INSTANT ] ', 'INSTANT', 100, 10000, 29500, 21500, 'Aktif', 3621, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5197, 3623, 'Twitter Likes', 'Twitter Likes [ MAX 15K ] NO REFILL ', 'INSTANT', 10, 15000, 72300, 64300, 'Aktif', 3623, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5198, 3624, 'Youtube Likes / Comments /', 'Youtube Likes [ 5K-10K/DAY ] NO REFILL - INSTANT', 'No Refill NO REFUND\r\n', 100, 100000, 31500, 23500, 'Aktif', 3624, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5199, 3625, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 15K [ NO REFILL - INSTANT ]', 'INSTANT', 50, 15000, 45800, 37800, 'Aktif', 3625, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5200, 3626, 'Youtube Likes / Comments /', 'Youtube Likes [ MAX 200K ] NOREFILL - INSTANT', 'INSTANT', 20, 2000000, 38000, 30000, 'Aktif', 3626, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5201, 3627, 'Youtube Likes / Comments /', ' Youtube Likes - MAX 25K [ Life Time Guaranteed ]', 'Instant Likes\r\n', 20, 25000, 63000, 55000, 'Aktif', 3627, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5202, 3628, 'Youtube Views', 'Youtube Views [ 5K-10K/DAY ] Lifetime Guarantee', 'Retention - 2-5 minutes ( JIKA DAPAT )\r\nEmergency Server\r\n\r\n ', 1000, 10000000, 62800, 54800, 'Aktif', 3628, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5203, 3630, 'Youtube Views', 'Youtube Views [ 1K-5K/DAY ] Lifetime Guaranted', 'instant\r\nRetention  5-20 Minutes ( jika dapat )\r\n', 100, 100000, 49500, 41500, 'Aktif', 3630, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5204, 3631, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [5K] [LOW DROP] [1H - 1K/Day] ', 'Real Max is 5K (you can order up to 5 times each time 1000 quantity).<br>\r\nFast<br>\r\nLow drop<br>\r\nNO REFILL NO REFUND (MQ ACCS)<br>', 50, 12000, 24500, 16500, 'Aktif', 3631, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5205, 3632, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [10K] [LOW DROP] [1H - 1K/Day] ', 'Real Max is 10K (you can order up to 10 times each time 1000 quantity).<br>\r\nFast<br>\r\nLow drop\r\nNO REFILL NO REFUND (MQ ACCS)', 100, 1000, 24400, 16400, 'Aktif', 3632, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5206, 3633, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers -Max 1K - 0-1 Minutes ', 'Min 100<br>\r\nMax 1000<br>\r\nAverage Delivery Time Per 1000 : 14 minutes', 100, 10000, 25500, 17500, 'Aktif', 3633, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5207, 3634, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers - Max 5K - 0-30 Minutes ', 'Min 50<br>\r\nMax 7500<br>\r\nAverage Delivery Time Per 1000 : 39 minutes', 50, 75000, 26800, 18800, 'Aktif', 3634, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5208, 3635, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Real Followers -Max 2K - 0-15 Minutes ', 'Min 100<br>\r\nMax 1000<br>\r\nAverage Delivery Time Per 1000 : Not enough data', 100, 10000, 27600, 19600, 'Aktif', 3635, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5209, 3636, 'Instagram Likes', 'Instagram Likes [ 300-500/Hour ] instant NON DROP NOW', 'Speed:300-500/hour\r\nNo Drop as of now [ No Refill Incase drop}', 10, 5000, 24300, 16300, 'Aktif', 3636, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5210, 3637, 'Instagram Likes', 'Instagram Likes - MAX 3K [ REAL - NO REFILL ] ', 'No refill\r\nINSTANT', 50, 3000, 22900, 14900, 'Aktif', 3637, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5211, 3639, 'Instagram Likes', 'Instagram Likes - MAX 5K [ NO REFILL ] INSTANT', 'INSTANT\r\nCAN HIGH DROOP', 10, 5000, 19700, 11700, 'Aktif', 3639, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5212, 3640, 'Instagram Views', 'Instagram Views - INSTANT [ MAX 1M ] ', '30-50k/hour\r\nSpeed can be slow sometimes\r\n', 500, 1000000, 15399, 7399, 'Aktif', 3640, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5213, 3641, 'Instagram Views', 'Instagram Views [ MAX 10M ] INSTANT -  Recommended ', 'instant', 100, 10000000, 15490, 7490, 'Aktif', 3641, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5214, 3642, 'Instagram Views', 'Instagram Views - MAX 500K [ FAST - INSTANT ] ', 'Instant Start\r\n', 100, 10000000, 15710, 7710, 'Aktif', 3642, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5215, 3643, 'Instagram Highlights / Profile Visits / Reach', 'Instagram Impressions + Profile Visits [ MAX 50K ] ', 'LINK POST NEW ONLY\r\n', 100, 50000, 28000, 20000, 'Aktif', 3643, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5216, 3644, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - BIG ORDERS [ REFILL 30DAYS ] ', 'INSTANT', 10, 500000, 37500, 29500, 'Aktif', 3644, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5217, 3645, 'Instagram Likes', 'Instagram Likes - MAX 15K [ REAL - INSTANT ] ', 'Real Likes\r\n1k/hour\r\n', 50, 15000, 26300, 18300, 'Aktif', 3645, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5218, 3646, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Views - MAX 1M [ INSTANT ] ', 'INSTANT', 100, 1000000, 15950, 7950, 'Aktif', 3646, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5219, 3647, 'Youtube Views', 'Youtube Views [ 10K-20K/DAY ] INSTANT - Lifetime Guarantee', 'INSTANT', 100, 10000000, 39600, 31600, 'Aktif', 3647, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5220, 3648, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ MAX 10K ] REAL MIX - REFILL 30DAYS', '2K-3k/day\r\n', 20, 10000, 35500, 27500, 'Aktif', 3648, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5221, 3650, 'Facebook Page Likes', 'Facebook Page Likes - MAX 5K [ REFILL 30DAYS ] ', 'LINK PAGE ONLY FROM BROWSER', 100, 5000, 71800, 63800, 'Aktif', 3650, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5222, 3654, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - [ BOT, SUPERFAST, NO REFILL, MAX 15k ] INSTANT-10mins', ' INSTANT START BOT PROFILE BIG DROPS NO REFILL', 10, 15000, 17950, 9950, 'Aktif', 3654, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5223, 3655, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers + 100% Reach + Impressions + Profile Visits - [ Max - 10K ] [ NO Refill - BOT ]', 'Instagram Followers + 100% Reach + Impressions + Profile Visits - [ Max - 10K ] [ NO Refill - BOT ] [ FASTEST ] INSTANT.', 10, 100002, 18450, 10450, 'Aktif', 3655, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5224, 3656, 'TikTok  Views, Komentar , Like Komentar &Share ', 'Tiktok - Views[ 30k-50k/day ] [ Superfast ] INSTANT-2HRS', 'Tiktok - Views S1 [ 30k-50k/day ] [ Superfast ] INSTANT-2HRS', 100, 1000000, 16850, 8850, 'Aktif', 3656, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5225, 3657, 'Instagram Views', 'Instagram Views - [ Max - 250M ] [ SUPERFAST ] SUPER INSTANT', 'Superfast! Order Will Be Start Instant, Per Hour Speed 1.5M!<br>\r\nUNLIMITED!', 1000, 2147483647, 15140, 7140, 'Aktif', 3657, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5226, 3658, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TikTok Views - Min 100 - MAX 100K', ' 1m/hour\r\nmin 100 max 50000', 100, 1000000, 16400, 8400, 'Aktif', 3658, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5227, 3659, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers Min 10 and Max 100k [Auto Refill 30 days]', '30 days guarantee\r\nauto refill\r\n1-3k/day', 100, 10000000, 30000, 22000, 'Aktif', 3659, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5228, 3660, 'TikTok  Views, Komentar , Like Komentar &Share ', 'Tiktok Views EMERGENCY SUPER FAST', '1 MILOIN PER MINUTE', 100, 10000000, 20500, 12500, 'Aktif', 3660, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5229, 3662, 'Instagram Followers Indonesia', 'INSTAGRAM FOLLOWERS INDONESIA SUPER FAST 20K REAL', 'INSTAGRAM FOLLOWERS INDONESIA SUPER FAST 1K', 100, 20000, 54000, 46000, 'Aktif', 3662, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5230, 3666, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers [ 99 Days Refill ] [50K]', '99 days refill Drop 0-5% [ Sometimes the drop can go upto 30-40%] ,<br>\r\nRefill Start time - 24-48 hours [ When overloaded 72 hours],<br>\r\nIF you drop feed and orders overlad, we do not guarantee it.', 10, 5000000, 31800, 23800, 'Aktif', 3666, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5231, 3667, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers Min 10 and Max 200k [Auto Refill 30 days]', ' 30 days guarantee auto refill 1-3k/day', 10, 20000000, 27400, 19400, 'Aktif', 3667, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5232, 3668, 'Instagram Likes Indonesia', 'CHEAP Instagram Likes Indonesia [2K] 1-2 DAYS START', '1-2 HARI BARU MASUK CHEAP  NO REFILL', 100, 1000, 19500, 11500, 'Aktif', 3668, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5233, 3669, 'Youtube Watchtime', 'Youtube Watchtime [ 4000 Hours] [48 Hours Finish ] [ NO REFILL ] [ 1hour + Video]', 'Waktu mulai  0-1 jam.<br>\r\nFinish within 48 Hours[ Sometimes take time upto 4 days] .<br>\r\nNo Refill, No Refund Views and hours may drop next day or next month [ No complains accepted like views did not come etc]<br>\r\nVIdeo Min - 1 Hour<br>\r\nCAN HIGH DROP ( NO REFILL - NO REFUND )', 100, 8000, 84000, 76000, 'Aktif', 3669, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5234, 3674, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - MAX 30K [ MIX - AUTO REFILL 30DAYS ] ', 'INSTANT', 50, 30000, 25800, 17800, 'Aktif', 3674, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5235, 3675, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Post Like [ MAX 10K ] REFILL 30DAYS', 'INSTANT', 20, 10000, 33750, 25750, 'Aktif', 3675, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5236, 3677, 'Facebook Video Views / Live Stream', 'Facebook Live Stream Views [ 30 minutes ] - CEK NOTED', 'TARGET ORDER JANGAN GUNAKAN = link mobile m.facebook.com ATAU facebook.com/watch/live/?v=id\r\nHANYA GUNAKAN TARGET = https://www.facebook.com/user(or IDuser)/videos/ID', 50, 2000, 104500, 96500, 'Aktif', 3677, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5237, 3680, 'Instagram Likes', 'Instagram Likes [ MAX 5K ] REAL - INSTANT', 'No Refill\r\nStart Instant\r\n', 10, 5000, 17600, 9600, 'Aktif', 3680, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5238, 3681, 'Instagram Likes', 'Instagram Likes - 1K/HOURS [ NO REFILL - INSTANT ]', 'CAN High Drop\r\n', 10, 10000, 18800, 10800, 'Aktif', 3681, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5239, 3682, 'Instagram Likes', 'Instagram Likes 100% Real [ TURKEY + ASIA ] INSTANT', 'turkey - asia targeted\r\n', 20, 50000, 20600, 12600, 'Aktif', 3682, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5240, 3683, 'Instagram Likes', 'Instagram Likes Real [ Indian + Arab Country ] NO REFILL', '100% real\r\nIndian and Arab User\r\n', 20, 5000, 24600, 16600, 'Aktif', 3683, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5241, 3684, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia SPECIAL [ 4K ] ', 'PROSES 1-2 HARI YA . DI JAMIN SUKSES NO REFILL NO REFUND AKUN REAL DARI AUTO FOLLOWERS GAK USAH TAKUT ', 100, 4000, 33000, 25000, 'Aktif', 3684, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5242, 3688, 'Youtube Views', 'Youtube views [ 10K-15K/DAY ] Lifetime Guaranted - Recommended', 'instant \r\nRecommended', 1000, 10000000, 41000, 33000, 'Aktif', 3688, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5243, 3689, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ 2-4K/DAY ] NO REFILL ', 'CAN HIGH DROP\r\nINSTANT', 10, 10000, 21800, 13800, 'Aktif', 3689, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5244, 3690, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 20K [ NO REFLL ] FAST', 'INSTANT - FAST\r\nCAN HIGH DROP', 10, 10000, 19600, 11600, 'Aktif', 3690, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5245, 3691, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ REAL + MIX ] INSTANT', 'instant', 100, 500, 28000, 20000, 'Aktif', 3691, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5246, 3692, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers - MAX 50K [ NO REFILL - 10K/DAY ] ', 'INSTANT FAST', 10, 50000, 27100, 19100, 'Aktif', 3692, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5247, 3693, 'Tiktok Followers', 'Tiktok Followers - MAX 15K [ REFILL 30DAYS ] Recommended', '30 days guarantee\r\n', 100, 10000, 61150, 53150, 'Aktif', 3693, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5248, 3694, 'Tiktok Followers', 'TikTok Followers [ MAX 100K ] GUARANTED 30DAYS ', 'INPUT LINK PROFIL\r\nEX: https://www.tiktok.com/@username', 100, 100000, 80300, 72300, 'Aktif', 3694, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5249, 3695, 'Tiktok Followers', 'TikTok Followers - MAX 30K [ REFILL 30DAYS ] ', 'Add Profile Link\r\n100% bot with no profile pciture\r\n', 50, 30000, 67500, 59500, 'Aktif', 3695, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5250, 3696, 'Tiktok Followers', 'TikTok Followers [ 10K/DAY ] NO REFILL - LQ', 'No Refill\r\nINSTANT', 10, 20000, 22150, 14150, 'Aktif', 3696, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5251, 3697, 'Tiktok Followers', 'TikTok Followers [ 5K/DAY ] REFILL 30DAYS ', 'INSTANT\r\nGUARANTED 30DAYS', 10, 5000, 33500, 25500, 'Aktif', 3697, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5252, 3698, 'Instagram Likes', 'Instagram Likes - MAX 10K [ LESS DROP - INSTANT ] ', '100-300/hour\r\nINSTANT', 100, 5000, 27500, 19500, 'Aktif', 3698, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5253, 3699, 'Instagram Likes', 'Instagram Likes [ 1K/DAY ] MIX - NOREFILL', 'Real Looking\r\nINSTANT', 10, 10000, 21800, 13800, 'Aktif', 3699, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5254, 3700, 'Instagram Likes', 'Instagram Likes [ 200-300/HOUR ] INSTANT FAST', 'Instant Start !\r\nReal + Bot', 20, 50000, 24900, 16900, 'Aktif', 3700, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5255, 3701, 'Instagram Likes', 'Instagram Likes - MAX 15K [ NOREFIL - FAST ] ', 'No Refill\r\nLikes Can Drop\r\n', 20, 15000, 22500, 14500, 'Aktif', 3701, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5256, 3702, 'Instagram Likes', 'Instagram Likes [ 1K-2K/HOURS ] REAL - INSTANT', 'INSTANT\r\nFAST', 50, 3000, 26200, 18200, 'Aktif', 3702, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5257, 3703, 'Instagram Likes', 'Instagram Likes [ MAX 5K ] REAL - FAST', 'instant\r\nno refill', 100, 5000, 22000, 14000, 'Aktif', 3703, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5258, 3706, 'Youtube Watchtime', 'Youtube Watchtime [ 4000 Hours ] [ 30DAYS REFILL ] CEK NOTE', 'PLEASE INPUT 1 hour+ video link\r\nDON\'T FOR LIVE STREAMING VIDEO\r\n7 day to finish 4000 hour\r\n', 100, 4000, 140000, 132000, 'Aktif', 3706, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5259, 3707, 'Youtube Watchtime', 'Youtube Watchtime - 4000 HOURS [ 30DAYS GUARANTED ] ', 'Input link video durasi 1 jam lebih<br>\r\nPesanan selesai hingga 5-12 hari<br>\r\nDo not make video private after receiving Watchtime and try to make original content<br>\r\nDo not Add Video below 1 hour<br>', 100, 4000, 138500, 130500, 'Aktif', 3707, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5260, 3708, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK KOMENTAR [250] ACCOUNT REAL INDONESIA', 'ISI LINK POSTINGAN TARGET YANG INGIN DI KOMEN  TERUS KOLOM KOMEN SESUKA KALIAN , KLIK ENTER UNTUK KOMENAN SELANJUTNYA /  KLIK ENTER UNTUK KOMEN LEBIH DARI 1 KOMENTAR HARGA MURAH Y', 5, 250, 315000, 307000, 'Aktif', 3708, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5261, 3709, 'TikTok  Views, Komentar , Like Komentar &Share ', 'TIKTOK LIKE KOMENTAR [250] ACCOUNT REAL INDONESIA ', 'ISI TARGET DENGAN USERNAME TIKTOK YANG KOMEN DI POSTINGAN , DAN ISI LINK DENGAN LINK POSTINGAN YANG SUDAH ANDA KOMEN AGAR KOMEN ANDA KAMI LIKE ', 5, 250, 65000, 57000, 'Aktif', 3709, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5262, 3712, 'Youtube Views', 'Youtube Views [ 10-20K/DAY ] REFILL 30DAYS ', 'GUARANTED 30DAYS', 100, 10000000, 38900, 30900, 'Aktif', 3712, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5263, 3713, 'Instagram Live Video', 'Instagram Live Viewers For 60 Minutes [ CEK NOTED ]', 'Enter username without @\r\nLakukan pemesanan setelah siaran langsung dari Perangkat yang berbeda\r\nJangan jeda sesi live\r\nAmbil bukti Screenshot RECORD jika tampilan langsung gagal untuk masalah terkait pengembalian dana.', 20, 2000, 235000, 227000, 'Aktif', 3713, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5264, 3714, 'Instagram Live Video', 'Instagram Live Video Views - Likes and Comments also [ CEK NOTED ] ', '\r\n\r\n \r\nStarts within 1-2 mints after ordering\r\nEnter username without @\r\nLIVE DULU BARU SUBMIT\r\nLIKE DAN COMMENT RANDOM\r\nJIKA ADA MASALAH HARAP SERTAKAN SCREENRECORD UNTUK KOMPLAIN ', 20, 30000, 235000, 227000, 'Aktif', 3714, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5265, 3715, 'Facebook Page Likes', 'Facebook Real Page Likes + Followers [ 800-1K/DAY ] ', 'LINK PROFIL PAGE ONLY\r\nDON\'T MAKE PRIVATE FOLLOWER & LIKE PAGE ', 20, 50000, 136000, 128000, 'Aktif', 3715, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5266, 3716, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Indonesian) ', 'LINK PROFIL ONLY<br>\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 100, 72300, 64300, 'Aktif', 3716, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5267, 3717, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Bangladesh) ', 'LINK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 5000, 72300, 64300, 'Aktif', 3717, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5268, 3718, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Philippines)', 'LINK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 3000, 72300, 64300, 'Aktif', 3718, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5269, 3719, 'Facebook Followers / Friends / Group Members', 'FB Profile Followers (Vietnam)', 'LINK PROFIL ONLY\r\nDON\'T MAKE PRIVATE ACCOUNT', 50, 3000, 72300, 64300, 'Aktif', 3719, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5270, 3720, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'test', 'test', 500, 6000, 115000, 107000, 'Aktif', 3720, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5271, 3723, 'Youtube Subscribers ', 'Youtube Subscriber [ UP 20-100/DAY ] REFILL 30DAYS', 'LINK CHANEL ONLY \r\n', 5, 1500, 378500, 370500, 'Aktif', 3723, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5272, 3724, 'Youtube Subscribers ', 'Youtube Subscriber - MAX 1.5K [ UP 30-50/DAY ] REFILL 30DAYS', 'Instant Start\r\nYou can add new order after your order complete. Actual maximum is 80.000\r\nLINK CHANEL ONLY', 5, 1500, 385000, 377000, 'Aktif', 3724, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5273, 3727, 'ZPRIVAT NOTE ORDER', 'PRIVET 700', 'USERNAME ONLY', 100, 700, 45000, 37000, 'Aktif', 3727, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5274, 3728, 'Instagram Likes Indonesia', 'Instagram Likes Photo / Video / TV / REEL Indonesia [5K] [REAL ACCOUNT]', 'LIKES REAL BISA LIKES POSTINGAN VIDEO POSTINGAN IG TV', 100, 5000, 32000, 24000, 'Aktif', 3728, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5275, 3729, 'Facebook Page Likes', 'Facebook Fan Page Likes + Followers [ MAX 200K ] REFILL 30DAYS', 'PLEASE INPUT LINK FROFIL PAGE DON\'T FROM MOBILE APP\r\nMAYBE DROP because real users\r\nBUT GUARANTED ', 20, 10000, 82500, 74500, 'Aktif', 3729, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5276, 3731, 'Instagram Followers No Refill/Not Guaranteed', 'Instagram Followers [ Real Indian + Asian ] NO REFILL - LESS DROP', '3-5k/day\r\nno refill\r\nReal accounts Asians with majority Indians\r\n', 50, 50000, 35600, 27600, 'Aktif', 3731, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5277, 3732, 'Instagram Views', 'Instagram Views - MAX 5M [ INSTANT - FAST ] ', 'INSTANT', 100, 500000, 15250, 7250, 'Aktif', 3732, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5278, 3733, 'Twitter Likes', 'Twitter Like [USA account] [ REFILL 30DAYS ] ', 'Up to 500-1k/day\r\nUSA accounts [ Mix Quality]\r\n', 20, 10000, 43000, 35000, 'Aktif', 3733, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5279, 3734, 'Twitter Followers', 'Twitter Followers - USA accounts [ REFILL 60DAYS ] ', 'USA accounts [ Mix Quality]\r\n', 10, 10000, 256500, 248500, 'Aktif', 3734, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5280, 3735, 'Twitter Followers', 'Twitter Followers - MAX 10K [ REFILL 30DAYS ] ', ' USA accounts\r\nSpeed Up to 500-1k/day\r\n', 10, 10000, 173000, 165000, 'Aktif', 3735, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5281, 3736, 'Instagram Likes', 'Instagram likes [ 10K/DAY ] INSTANT - NO REFILL', 'INSTANT', 10, 10000, 17800, 9800, 'Aktif', 3736, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5282, 3737, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook Random Comments [Worldwide ] - REFILL 30DAYS', 'Real + Mix\r\nSpeed - 200+Day\r\n', 10, 1000, 462000, 454000, 'Aktif', 3737, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5283, 3738, 'Facebook Post Likes / Comments / Shares / Events', 'Facebook CUSTOM Comments [Worldwide ] - REFILL 30DAYS', 'SATU KALIMAT SATU BARIS \r\nReal + Mix\r\nSpeed - 200+Day\r\n', 10, 1000, 550500, 542500, 'Aktif', 3738, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5284, 3739, 'Facebook Followers / Friends / Group Members', 'Facebook Real Followers [ 1K/DAY ] REFILL 15DAYS', 'LINK PROFIL ONLY, FROM FACEBOOK BROWSER\r\nMAKE PUBLIC ACCOUNT', 100, 10000, 48000, 40000, 'Aktif', 3739, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5285, 3740, 'Facebook Followers / Friends / Group Members', 'Facebook Followers [ 1K-2K/DAY ] REFILL 30DAYS', 'LINK PROFIL ONLY , FROM FACEBOOK BROWSER\r\n', 100, 20000, 54000, 46000, 'Aktif', 3740, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5286, 3741, 'Instagram Story Indonesia', 'Instagram ALL STORY INDONESIA [2K] INPUT ONLY INSTAGRAM', 'AKUN BOT+REAL , ALL STORY INPUT USERNAME', 100, 2000, 20000, 12000, 'Aktif', 3741, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5287, 3742, 'ZPRIVAT NOTE ORDER', 'PRIVAT JANGAN ORDER 12000', 'Username only', 100, 2000, 28000, 20000, 'Aktif', 3742, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5288, 3743, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'Shopee Followers BOT INDONESIA USERNAME ONLY INPUTNYA [AKUN BERFOTO] [1,5K]', 'USERNAME ONLY', 100, 1500, 30000, 22000, 'Aktif', 3743, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5289, 3744, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'PRODUK 500 TERJUAL 1 ULASAN 1 RATING [ BACA DESKRIPSI JANGAN ASAL ORDER] ', 'username | password | Link Produk<br>\r\nsilahkan baca deskripsi dan ketentuan disini https://followersindo.net/tutorial/', 500, 500, 565000, 557000, 'Aktif', 3744, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5290, 3745, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', 'PRODUK 1000 TERJUAL 1 ULASAN 1 RATING [ BACA DESKRIPSI JANGAN ASAL ORDER] ', 'username | password | Link Produk <br>\r\nsilahkan baca deskripsi dan ketentuan disini https://followersindo.net/tutorial/', 1000, 1000, 465000, 457000, 'Aktif', 3745, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5291, 3746, 'Youtube Views', 'Youtube Views [ 5K-10K/DAY ] Lifetime Guaranteed', 'NOT FOR VIDEO STREAMING\r\nLifetime Guarantee\r\n', 100, 10000000, 33750, 25750, 'Aktif', 3746, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5292, 3747, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 100K [ REFILL 30DAYS ] ', '30 days guarantee\r\n', 50, 100000, 35600, 27600, 'Aktif', 3747, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5293, 3748, 'Youtube Likes / Comments /', 'Youtube Likes - MAX 50K [ REFILL 30DAYS ] ', 'INSTANT', 10, 25000, 52400, 44400, 'Aktif', 3748, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5294, 3749, 'Instagram Followers [Refill] [Guaranteed] [NonDrop]', 'Instagram Followers - MAX 20K [ GUARANTEED 30DAYS ] ', 'INSTANT\r\nSpeed - 2-5k/day\r\n', 50, 20000, 26900, 18900, 'Aktif', 3749, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5295, 3750, 'Spotify', 'Spotify Plays [ 5K-10K/DAY ] - 100% REAL', 'INSTANT', 5000, 1000000, 33800, 25800, 'Aktif', 3750, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5296, 3751, 'Instagram Comments', 'Instagram Comments Likes - MAX 5K', 'Instagram Comments Likes\r\nRANDOM ACCOUNT', 10, 5000, 20500, 12500, 'Aktif', 3751, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5297, 3752, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views - MAX 3K [ All Story ]', 'INPUT USERNAME PROFILE', 100, 5000, 16300, 8300, 'Aktif', 3752, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5298, 3753, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Story Views - All Story [ MAX 20K ] ', 'INPUT USERNAME PROFILE ONLY', 100, 20000, 15560, 7560, 'Aktif', 3753, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5299, 3754, 'Instagram Story / Impressions / Saves /  Reach', 'Instagram Impression - 100K/DAY [ INSTANT ] ', 'INSTANT', 100, 1000000, 17100, 9100, 'Aktif', 3754, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5300, 3755, 'Instagram Story / Impressions / Saves /  Reach', 'Ä°nstagram All Views Story - MAX 5K', 'INPUT USERNAME PROFILE ONLY', 100, 5000, 23900, 15900, 'Aktif', 3755, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5301, 3756, 'Facebook Video Views / Live Stream', 'Facebook Video Views - INSTANT [ FAST ] ', 'Only Facebook Desktop link Support !!!<br>\r\nJANGAN GUNAKAN LINK = https://m.facebook.com/story.php?story_fbid=663516740711263&id=100011588298861<br>\r\nGUNAKAN LAH LINK SEPERTI INI = https://www.facebook.com/tha.mayor/posts/663516740711263', 500, 100000000, 19300, 11300, 'Aktif', 3756, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5302, 3757, 'Tiktok Likes', 'TikTok Likes - MAX 1K [ INSTANT ] ', 'Instant start\r\n', 100, 1000, 24500, 16500, 'Aktif', 3757, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5303, 3758, 'Instagram Followers Indonesia', 'Instagram Followers AKTIP Indonesia SPECIAL [ 6K ]', 'REAL', 100, 6000, 34500, 26500, 'Aktif', 3758, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5304, 3759, 'Shopee/BukaLapak/Tokopedia / BIGO / CubeTV / NimoTV/', '  Shopee Likes Indonesia Bot [1.5K] Shopee Favorite / Like Produk Indonesia [TERMURAH] CEK NOTE', 'CONTOH LINK <br>\r\nhttps://shopee.co.id/DIXON-Kaos-Pria-Kerah-List-Polo-Terbaru-i.66010373.6584131982', 100, 1500, 20000, 12000, 'Aktif', 3759, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5305, 3760, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views [ Max 1M ] Instant', 'link reels only', 250, 10000000, 15450, 7450, 'Aktif', 3760, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5306, 3761, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views - 5M/Day', 'instant', 250, 500000000, 15390, 7390, 'Aktif', 3761, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5307, 3762, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Views [ 1M/DAY ] INSTANT - FAST', 'LINK REELS ONLY', 100, 10000000, 15290, 7290, 'Aktif', 3762, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5308, 3763, 'Instagram Reels Views/Likes/Comments', 'Instagram Reels Likes [ MAX 50K ] Instant', 'HIGH QUALITY\r\nREAL ACCOUNTS\r\n', 50, 50000, 53700, 45700, 'Aktif', 3763, 'IRVANKEDE', 'SOSIAL MEDIA'),
(5309, 0, 'P', 'P', 'P', 0, 0, 15000, 7000, 'Aktif', 0, 'IRVANKEDE', 'SOSIAL MEDIA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `metode_depo`
--

CREATE TABLE `metode_depo` (
  `id` int(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `catatan` text NOT NULL,
  `rate` varchar(255) NOT NULL,
  `nama_penerima` varchar(100) NOT NULL,
  `tujuan` varchar(250) NOT NULL,
  `tipe` enum('Transfer Pulsa','Transfer Bank','Payment Gateway') NOT NULL,
  `jenis` enum('Otomatis','Manual') NOT NULL,
  `minimal` int(10) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi`
--

CREATE TABLE `mutasi` (
  `id` int(11) NOT NULL,
  `kode_deposit` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `jumlah` int(255) NOT NULL,
  `saldo` varchar(250) NOT NULL,
  `status` enum('Dana Belum Masuk','Dana Sudah Masuk') NOT NULL,
  `status_aksi` enum('Belum Dikonfirmasi','Sudah Dikonfirmasi') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi_bank`
--

CREATE TABLE `mutasi_bank` (
  `id` int(11) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi_bca`
--

CREATE TABLE `mutasi_bca` (
  `id` int(11) NOT NULL,
  `tipe` varchar(10) NOT NULL,
  `keterangan` text NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal` varchar(10) NOT NULL,
  `status` enum('UNREAD','READ') NOT NULL,
  `provider` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi_gopay`
--

CREATE TABLE `mutasi_gopay` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `amount` double NOT NULL,
  `descript` text NOT NULL,
  `datetime` varchar(100) NOT NULL,
  `status` enum('READ','UNREAD') NOT NULL,
  `provider` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mutasi_ovo`
--

CREATE TABLE `mutasi_ovo` (
  `id` int(11) NOT NULL,
  `invoice` varchar(255) NOT NULL,
  `account` varchar(80) NOT NULL,
  `amount` int(11) NOT NULL,
  `descript` text NOT NULL,
  `sender` varchar(80) NOT NULL,
  `date` varchar(80) NOT NULL,
  `status` enum('UNREAD','READ') NOT NULL,
  `provider` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ovo`
--

CREATE TABLE `ovo` (
  `id` varchar(10) NOT NULL,
  `nomor` varchar(18) NOT NULL,
  `device` varchar(120) NOT NULL,
  `kode` varchar(4) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_pascabayar`
--

CREATE TABLE `pembelian_pascabayar` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `id_layanan` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `kategori` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `profit` double NOT NULL,
  `koin` double NOT NULL,
  `target` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama_penerima` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi1` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi2` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi3` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `deskripsi4` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Pending','Error','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'WEB',
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `refund` enum('0','1') COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_pulsa`
--

CREATE TABLE `pembelian_pulsa` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `profit` double NOT NULL,
  `koin` double NOT NULL,
  `target` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Pending','Error','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` varchar(50) COLLATE utf8_swedish_ci NOT NULL DEFAULT 'WEB',
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `refund` enum('0','1') COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_sosmed`
--

CREATE TABLE `pembelian_sosmed` (
  `id` int(10) NOT NULL,
  `oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `provider_oid` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `target` text COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(10) NOT NULL,
  `remains` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `start_count` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `harga` double NOT NULL,
  `profit` double NOT NULL,
  `koin` double NOT NULL,
  `status` enum('Pending','Processing','Error','Partial','Success') COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `provider` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `place_from` enum('Website','API') COLLATE utf8_swedish_ci NOT NULL,
  `refund` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pertanyaan_umum`
--

CREATE TABLE `pertanyaan_umum` (
  `id` int(4) NOT NULL,
  `number` varchar(25) NOT NULL,
  `tipe` text NOT NULL,
  `title` text NOT NULL,
  `konten` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pertanyaan_umum`
--

INSERT INTO `pertanyaan_umum` (`id`, `number`, `tipe`, `title`, `konten`) VALUES
(1, '1', 'Akun', 'Bagaimana cara mendaftarnya? Apakah ada biaya pendaftaran?', 'Pendaftaran cukup klik Register, dan isi data sesuai yang dibutuhkan, kamu sudah terdaftar di Medan Pedia. Untuk pendaftaran GRATIS tidak dipungut biaya seperserpun.'),
(2, '2', 'Pesanan', 'Bagaimana cara membuat Pesanan ?', 'Untuk membuat pesanan sangatlah mudah, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman Pemesanan dengan mengklik menu yang sudah tersedia. Selain itu Anda juga dapat melakukan pemesanan melalui request API.'),
(3, '3', 'Isi Saldo', 'Bagaimana cara melakukan Pengisian Saldo ?', 'Untuk melakukan pengisian saldo, Anda hanya perlu masuk terlebih dahulu ke akun Anda dan menuju halaman deposit dengan mengklik menu yang sudah tersedia. Kami menyediakan deposit melalui bank dan pulsa.'),
(4, '4', 'Status', 'Apa Itu Partial?', 'Status Partial adalah ketika kami mengembalikan sebagian sisa-sisa pesanan. Terkadang karena beberapa alasan kami tidak dapat mengirimkan pesanan penuh, jadi kami mengembalikan Saldo sesuai jumlah yang belum terkirim kepada Anda. Contoh: Anda membeli pesanan dengan jumlah 1000 dan membebankan biaya 10.000, katakanlah kami mengirimkan 900 dan Kurang 100 tidak dapat kami kirim, maka kami akan \"Kembalikan saldo\" pesanan dan mengembalikan kurang 100 kepada Anda Kami mengembalikan saldo anda 1.000).'),
(5, '5', 'Sosial Media', 'Apa perbedaan semua server di setiap layanan?', 'Disetiap layanan kami memberikan perbedaan harga, kualitas dan kecepatan proses, rata-rata server kami optimal, apabila tidak mengalami gangguan. Dan kami selalu memberikan informasi/update layanan di info panel.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan_tiket`
--

CREATE TABLE `pesan_tiket` (
  `id` int(10) NOT NULL,
  `id_tiket` int(10) NOT NULL,
  `pengirim` enum('Member','Admin') COLLATE utf8_swedish_ci NOT NULL,
  `user` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `pesan` text COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `update_terakhir` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `promo_layanan`
--

CREATE TABLE `promo_layanan` (
  `id` int(10) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `layanan` varchar(100) NOT NULL,
  `harga_normal` int(11) NOT NULL,
  `harga_promo` int(11) NOT NULL,
  `tipe` enum('Sosial Media','Top Up') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provider`
--

CREATE TABLE `provider` (
  `id` int(10) NOT NULL,
  `code` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `api_id` varchar(50) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `provider`
--

INSERT INTO `provider` (`id`, `code`, `link`, `api_key`, `api_id`) VALUES
(1, 'IRVANKEDE', 'https://api.irvankede-smm.co.id/', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provider_pulsa`
--

CREATE TABLE `provider_pulsa` (
  `id` int(10) NOT NULL,
  `code` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `api_key` varchar(1100) COLLATE utf8_swedish_ci NOT NULL,
  `api_id` varchar(100) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `provider_pulsa`
--

INSERT INTO `provider_pulsa` (`id`, `code`, `link`, `api_key`, `api_id`) VALUES
(4, 'DG-PULSA', 'https://api.digiflazz.com/v1/transaction', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_referral`
--

CREATE TABLE `riwayat_referral` (
  `id` int(10) NOT NULL,
  `username` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `uplink` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `kode` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_saldo_koin`
--

CREATE TABLE `riwayat_saldo_koin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `tipe` enum('Koin','Saldo') NOT NULL,
  `aksi` enum('Penambahan Saldo','Pengurangan Saldo','Penambahan Koin','Pengurangan Koin') NOT NULL,
  `nominal` double NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_transfer`
--

CREATE TABLE `riwayat_transfer` (
  `id` int(10) NOT NULL,
  `tipe` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `pengirim` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `penerima` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` double NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `semua_pembelian`
--

CREATE TABLE `semua_pembelian` (
  `id` int(10) NOT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_pesan` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `layanan` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `target` varchar(50) NOT NULL,
  `status` enum('Pending','Processing','Error','Success','Partial') NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `place_from` enum('API','WEB') NOT NULL,
  `refund` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_harga_untung`
--

CREATE TABLE `setting_harga_untung` (
  `id` int(11) NOT NULL,
  `kategori` enum('WEBSITE','API') NOT NULL,
  `tipe` enum('Sosial Media','Top Up') NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_harga_untung`
--

INSERT INTO `setting_harga_untung` (`id`, `kategori`, `tipe`, `harga`) VALUES
(1, 'WEBSITE', 'Sosial Media', 15000),
(2, 'API', 'Sosial Media', 7000),
(3, 'WEBSITE', 'Top Up', 500),
(4, 'API', 'Top Up', 250);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_koin`
--

CREATE TABLE `setting_koin` (
  `id` int(4) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `minimal` varchar(50) NOT NULL,
  `rate` varchar(25) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_koin`
--

INSERT INTO `setting_koin` (`id`, `tipe`, `minimal`, `rate`, `status`) VALUES
(1, 'Tarik Koin Ke Saldo', '50000', '0.2', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_koin_didapat`
--

CREATE TABLE `setting_koin_didapat` (
  `id` int(11) NOT NULL,
  `rate` varchar(10) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_koin_didapat`
--

INSERT INTO `setting_koin_didapat` (`id`, `rate`, `status`) VALUES
(1, '0.03', 'Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_rate`
--

CREATE TABLE `setting_rate` (
  `id` int(11) NOT NULL,
  `tipe` enum('Sosial Media','Top Up','Pascabayar') NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_rate`
--

INSERT INTO `setting_rate` (`id`, `tipe`, `rate`) VALUES
(1, 'Sosial Media', 15000),
(2, 'Top Up', 500),
(3, 'Pascabayar', 2500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_referral`
--

CREATE TABLE `setting_referral` (
  `id` int(4) NOT NULL,
  `jumlah` varchar(25) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_referral`
--

INSERT INTO `setting_referral` (`id`, `jumlah`, `status`) VALUES
(1, '1000', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting_web`
--

CREATE TABLE `setting_web` (
  `id` int(11) NOT NULL,
  `short_title` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `deskripsi_web` text NOT NULL,
  `kontak_utama` text NOT NULL,
  `lokasi` varchar(200) NOT NULL,
  `kode_pos` varchar(25) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `setting_web`
--

INSERT INTO `setting_web` (`id`, `short_title`, `title`, `deskripsi_web`, `kontak_utama`, `lokasi`, `kode_pos`, `date`, `time`) VALUES
(1, 'Demo Okepedia', 'Demo - Okepedia', 'Okepedia Adalah Sebuah Platform Bisnis Yang Menyediakan Berbagai Layanan MultI Media Marketing Yang Bergerak Terutama Di Indonesia. Dengan Bergabung Bersama Kami, Anda Dapat Menjadi Penyedia Jasa Sosial Media Atau Reseller Sosial Media Seperti Jasa Penambah Followers, Likes, Views, Subscribe, Dll. Saat Ini Tersedia Berbagai Layanan Untuk Sosial Media Terpopuler Seperti Instagram, Facebook, Twitter, Youtube, Dll. Dan Kamipun Juga Menyediakan Panel Pulsa & PPOB Seperti Pulsa All Operator, Paket Data, Saldo Gojek/Grab, Token PLN, All Voucher Game Online, Dll.', '085866501532', 'Kuningan, Jawa Barat', '45562', '2018-12-21', '07:24:10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tes`
--

CREATE TABLE `tes` (
  `id` int(11) NOT NULL,
  `tes` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tiket`
--

CREATE TABLE `tiket` (
  `id` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `subjek` varchar(250) NOT NULL,
  `pesan` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `update_terakhir` datetime NOT NULL,
  `status` enum('Pending','Responded','Waiting','Closed') NOT NULL,
  `this_user` int(1) NOT NULL,
  `this_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tipe_pembayaran`
--

CREATE TABLE `tipe_pembayaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `kode` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('ON','OFF') COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `tipe_pembayaran`
--

INSERT INTO `tipe_pembayaran` (`id`, `nama`, `kode`, `status`) VALUES
(1, 'MYBVA', 'Maybank Virtual Account', ''),
(2, 'PERMATAVA', 'Permata Virtual Account', 'ON'),
(3, 'BNIVA', 'BNI Virtual Account', 'ON'),
(4, 'BRIVA', 'BRI Virtual Account', 'OFF'),
(5, 'MANDIRIVA', 'Mandiri Virtual Account', 'ON'),
(6, 'BCAVA', 'BCA Virtual Account', 'ON'),
(7, 'SMSVA', 'Sinarmas Virtual Account', 'ON'),
(8, 'MUAMALATVA', 'Muamalat Virtual Account', 'ON'),
(9, 'CIMBVA', 'CIMB Virtual Account', 'ON'),
(10, 'BRIVAOP', 'BRI Virtual Account (Open Payment)', ''),
(11, 'CIMBVAOP', 'CIMB Niaga Virtual Account (Open Payment)', 'ON'),
(12, 'BCAVAOP', 'BCA Virtual Account (Open Payment)', 'ON'),
(13, 'BNIVAOP', 'BNI Virtual Account (Open Payment)', ''),
(14, 'ALFAMART', 'Alfamart', 'ON'),
(15, 'ALFAMIDI', 'Alfamidi', 'ON'),
(16, 'QRIS', 'QRIS', 'ON'),
(17, 'QRISC', 'QRIS (Customizable)', 'ON'),
(18, 'QRISOP', 'QRIS (Open Payment)', 'ON'),
(19, 'QRISCOP', 'QRIS (Open Payment - Customizable)', 'ON');

-- --------------------------------------------------------

--
-- Struktur dari tabel `top_depo`
--

CREATE TABLE `top_depo` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(250) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `top_layanan`
--

CREATE TABLE `top_layanan` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `layanan` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(100) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `top_users`
--

CREATE TABLE `top_users` (
  `id` int(10) NOT NULL,
  `method` varchar(200) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `jumlah` int(250) NOT NULL,
  `total` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_depan` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama_belakang` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `nama` text COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `saldo_sosmed` int(10) NOT NULL,
  `saldo_top_up` int(10) NOT NULL,
  `pemakaian_saldo` double NOT NULL,
  `level` enum('Member','Agen','Developers') COLLATE utf8_swedish_ci NOT NULL,
  `status` enum('Aktif','Tidak Aktif') COLLATE utf8_swedish_ci NOT NULL,
  `status_akun` enum('Sudah Verifikasi','Belum Verifikasi') COLLATE utf8_swedish_ci NOT NULL,
  `pin` int(6) NOT NULL,
  `api_key` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `uplink` varchar(100) COLLATE utf8_swedish_ci NOT NULL,
  `uplink_referral` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `koin` double NOT NULL,
  `no_hp` varchar(25) COLLATE utf8_swedish_ci NOT NULL,
  `kode_verifikasi` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `kode_referral` varchar(50) COLLATE utf8_swedish_ci NOT NULL,
  `random_kode` varchar(20) COLLATE utf8_swedish_ci NOT NULL,
  `read_news` int(1) NOT NULL,
  `cookie_token` varchar(200) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_belakang`, `nama`, `email`, `username`, `password`, `saldo_sosmed`, `saldo_top_up`, `pemakaian_saldo`, `level`, `status`, `status_akun`, `pin`, `api_key`, `uplink`, `uplink_referral`, `date`, `time`, `koin`, `no_hp`, `kode_verifikasi`, `kode_referral`, `random_kode`, `read_news`, `cookie_token`) VALUES
(1, 'Akun', 'Demo', 'Demo 123', 'demo@okepedia.my.id', 'demo123', '$2y$10$vxx58gQjqY4ePdBaMZ5ZuOgq0y6sXwiJeT0q2p5BO5/6SDI9LGGWm', 0, 0, 769148.3, 'Developers', 'Aktif', 'Sudah Verifikasi', 123456, 'lKp1BesbhX4zbO8NuN96', 'Pendaftaran Gratis', '', '2021-06-02', '13:51:54', 1.64, '6282212345678', '738863', 'SM-301093', 'V9EudePr4j6614263337', 1, '62cc2d8b4bf2d8728120d052163a77df');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aktifitas`
--
ALTER TABLE `aktifitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indeks untuk tabel `bca`
--
ALTER TABLE `bca`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cek_akun`
--
ALTER TABLE `cek_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `child_panel`
--
ALTER TABLE `child_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gopay`
--
ALTER TABLE `gopay`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `harga_kode_undangan`
--
ALTER TABLE `harga_kode_undangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ketentuan_layanan`
--
ALTER TABLE `ketentuan_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kode_undangan`
--
ALTER TABLE `kode_undangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kode_voucher`
--
ALTER TABLE `kode_voucher`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontak_admin`
--
ALTER TABLE `kontak_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontak_website`
--
ALTER TABLE `kontak_website`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan_pascabayar`
--
ALTER TABLE `layanan_pascabayar`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan_pulsa`
--
ALTER TABLE `layanan_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan_sosmed`
--
ALTER TABLE `layanan_sosmed`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `metode_depo`
--
ALTER TABLE `metode_depo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mutasi_bca`
--
ALTER TABLE `mutasi_bca`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mutasi_gopay`
--
ALTER TABLE `mutasi_gopay`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mutasi_ovo`
--
ALTER TABLE `mutasi_ovo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `ovo`
--
ALTER TABLE `ovo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pertanyaan_umum`
--
ALTER TABLE `pertanyaan_umum`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesan_tiket`
--
ALTER TABLE `pesan_tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `promo_layanan`
--
ALTER TABLE `promo_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `provider_pulsa`
--
ALTER TABLE `provider_pulsa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_referral`
--
ALTER TABLE `riwayat_referral`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_saldo_koin`
--
ALTER TABLE `riwayat_saldo_koin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat_transfer`
--
ALTER TABLE `riwayat_transfer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `semua_pembelian`
--
ALTER TABLE `semua_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_harga_untung`
--
ALTER TABLE `setting_harga_untung`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_koin`
--
ALTER TABLE `setting_koin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_koin_didapat`
--
ALTER TABLE `setting_koin_didapat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_rate`
--
ALTER TABLE `setting_rate`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_referral`
--
ALTER TABLE `setting_referral`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `setting_web`
--
ALTER TABLE `setting_web`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tes`
--
ALTER TABLE `tes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tipe_pembayaran`
--
ALTER TABLE `tipe_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `top_depo`
--
ALTER TABLE `top_depo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `top_layanan`
--
ALTER TABLE `top_layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `top_users`
--
ALTER TABLE `top_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `no_hp` (`no_hp`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `aktifitas`
--
ALTER TABLE `aktifitas`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `cek_akun`
--
ALTER TABLE `cek_akun`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2013;

--
-- AUTO_INCREMENT untuk tabel `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `harga_kode_undangan`
--
ALTER TABLE `harga_kode_undangan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT untuk tabel `ketentuan_layanan`
--
ALTER TABLE `ketentuan_layanan`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kode_undangan`
--
ALTER TABLE `kode_undangan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kode_voucher`
--
ALTER TABLE `kode_voucher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `layanan_pascabayar`
--
ALTER TABLE `layanan_pascabayar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT untuk tabel `layanan_pulsa`
--
ALTER TABLE `layanan_pulsa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2164;

--
-- AUTO_INCREMENT untuk tabel `layanan_sosmed`
--
ALTER TABLE `layanan_sosmed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5310;

--
-- AUTO_INCREMENT untuk tabel `metode_depo`
--
ALTER TABLE `metode_depo`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `mutasi`
--
ALTER TABLE `mutasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mutasi_bca`
--
ALTER TABLE `mutasi_bca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mutasi_gopay`
--
ALTER TABLE `mutasi_gopay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mutasi_ovo`
--
ALTER TABLE `mutasi_ovo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pertanyaan_umum`
--
ALTER TABLE `pertanyaan_umum`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pesan_tiket`
--
ALTER TABLE `pesan_tiket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `promo_layanan`
--
ALTER TABLE `promo_layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `provider_pulsa`
--
ALTER TABLE `provider_pulsa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `riwayat_referral`
--
ALTER TABLE `riwayat_referral`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_saldo_koin`
--
ALTER TABLE `riwayat_saldo_koin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `riwayat_transfer`
--
ALTER TABLE `riwayat_transfer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `semua_pembelian`
--
ALTER TABLE `semua_pembelian`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting_harga_untung`
--
ALTER TABLE `setting_harga_untung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `setting_koin`
--
ALTER TABLE `setting_koin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `setting_koin_didapat`
--
ALTER TABLE `setting_koin_didapat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `setting_rate`
--
ALTER TABLE `setting_rate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `setting_web`
--
ALTER TABLE `setting_web`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tes`
--
ALTER TABLE `tes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tipe_pembayaran`
--
ALTER TABLE `tipe_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT untuk tabel `top_depo`
--
ALTER TABLE `top_depo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `top_layanan`
--
ALTER TABLE `top_layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `top_users`
--
ALTER TABLE `top_users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=520;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
