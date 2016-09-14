enum device_variant {
    G930F,
    G930S,
    G930K,
    G930L,
    G930W8,
    G935F,
    G935S,
    G935K,
    G935L,
    G935W8,
};

device_variant match(std::string bl)
{
    if (bl.find("G930F") != std::string::npos) {
        return G930F;
    } else if (bl.find("G930W8") != std::string::npos) {
        return G930W8;
    } else if (bl.find("G930S") != std::string::npos) {
        return G930S;
    } else if (bl.find("G930K") != std::string::npos) {
        return G930K;
    } else if (bl.find("G930L") != std::string::npos) {
        return G930L;
    } else if (bl.find("G935S") != std::string::npos) {
        return G935S;
    } else if (bl.find("G935K") != std::string::npos) {
        return G935K;
    } else if (bl.find("G935L") != std::string::npos) {
        return G935L;
    } else if (bl.find("G935W8") != std::string::npos) {
        return G935W8;
    } else {
        return G935F;
    }
}
