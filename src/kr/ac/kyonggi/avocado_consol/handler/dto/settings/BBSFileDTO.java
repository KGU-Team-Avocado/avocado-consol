package kr.ac.kyonggi.avocado_consol.handler.dto.settings;

public class BBSFileDTO {
    public String original_FileName, real_FileName , major;
    public int id, bbs_id;

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getOriginal_FileName() {
        return original_FileName;
    }

    public void setOriginal_FileName(String original_FileName) {
        this.original_FileName = original_FileName;
    }

    public String getReal_FileName() {
        return real_FileName;
    }

    public void setReal_FileName(String real_FileName) {
        this.real_FileName = real_FileName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBbs_id() {
        return bbs_id;
    }

    public void setBbs_id(int bbs_id) {
        this.bbs_id = bbs_id;
    }
}
