class NxOptions<T> {
    String? imageAsset;
    String? imageNetwork;
    String? name;
    T? value;
    bool? isSelected;

    NxOptions({
        this.imageAsset,
        this.imageNetwork,
        this.name,
        this.value
    });
    
    NxOptions.withSelected({
        this.imageAsset,
        this.imageNetwork,
        this.name,
        this.value,
        this.isSelected
    });
}
