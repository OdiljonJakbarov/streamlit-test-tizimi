-- ═══════════════════════════════════════════════════════
-- TEST TIZIMI — Supabase jadvallar
-- Bu skriptni Supabase SQL Editor da ishga tushiring
-- ═══════════════════════════════════════════════════════

-- 1. O'qituvchilar jadvali
CREATE TABLE IF NOT EXISTS teachers (
    id          TEXT PRIMARY KEY,
    name        TEXT NOT NULL,
    username    TEXT UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    email       TEXT DEFAULT '',
    created_at  TEXT DEFAULT '',
    is_active   INTEGER DEFAULT 1,
    time_limit  INTEGER DEFAULT 30,
    question_count INTEGER DEFAULT 10
);

-- 2. Natijalar jadvali
CREATE TABLE IF NOT EXISTS results (
    id          TEXT PRIMARY KEY,
    fio         TEXT,
    grp         TEXT,
    category    TEXT,
    total       INTEGER,
    correct     INTEGER,
    wrong       INTEGER,
    percentage  REAL,
    date        TEXT,
    answers     TEXT DEFAULT '[]',
    teacher_id  TEXT
);

-- 3. Faol testlar (test jarayonida)
CREATE TABLE IF NOT EXISTS active_tests (
    token       TEXT PRIMARY KEY,
    fio         TEXT,
    grp         TEXT,
    category    TEXT,
    questions   TEXT DEFAULT '[]',
    start_time  REAL,
    time_limit  INTEGER,
    answers     TEXT DEFAULT '[]',
    created_at  REAL,
    teacher_id  TEXT
);

-- 4. Test fayllari metadatasi
CREATE TABLE IF NOT EXISTS test_files (
    id          TEXT PRIMARY KEY,
    teacher_id  TEXT NOT NULL,
    name        TEXT NOT NULL,
    content_b64 TEXT NOT NULL,
    created_at  TEXT DEFAULT ''
);

-- 5. Sozlamalar (admin paroli)
CREATE TABLE IF NOT EXISTS config (
    key         TEXT PRIMARY KEY,
    value       TEXT
);

-- Admin paroli: admin123 (scrypt hash)
INSERT INTO config (key, value)
VALUES ('admin_password', 'scrypt:32768:8:1$placeholder$hash')
ON CONFLICT (key) DO NOTHING;

-- ═══════════════════════════════════════════════════════
-- RLS (Row Level Security) — barcha jadvallarga
-- ═══════════════════════════════════════════════════════
ALTER TABLE teachers     ENABLE ROW LEVEL SECURITY;
ALTER TABLE results      ENABLE ROW LEVEL SECURITY;
ALTER TABLE active_tests ENABLE ROW LEVEL SECURITY;
ALTER TABLE test_files   ENABLE ROW LEVEL SECURITY;
ALTER TABLE config       ENABLE ROW LEVEL SECURITY;

-- Barcha amallar uchun ochiq policy (dastur server tomonida ishlaydi)
CREATE POLICY "allow_all_teachers"     ON teachers     FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_results"      ON results      FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_active_tests" ON active_tests FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_test_files"   ON test_files   FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "allow_all_config"       ON config       FOR ALL USING (true) WITH CHECK (true);

-- Tekshirish
SELECT 'Jadvallar muvaffaqiyatli yaratildi!' as status;
