@extends('layouts.admin')
@section('content')

<div class="card">
    <div class="card-header">
        {{ trans('global.edit') }} {{ trans('cruds.city.title_singular') }}
    </div>

    <div class="card-body">
        <form method="POST" action="{{ route("admin.cities.update", [$city->id]) }}" enctype="multipart/form-data">
            @method('PUT')
            @csrf
            <div class="form-group">
                <label class="required" for="name">{{ trans('cruds.city.fields.name') }}</label>
                <input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="name" id="name" value="{{ old('name', $city->name) }}" required>
                @if($errors->has('name'))
                    <div class="invalid-feedback">
                        {{ $errors->first('name') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.city.fields.name_helper') }}</span>
            </div>
            <div class="form-group">
                <label class="required" for="country_id">{{ trans('cruds.city.fields.country') }}</label>
                <select class="form-control select2 {{ $errors->has('country') ? 'is-invalid' : '' }}" name="country_id" id="country_id" required>
                    @foreach($countries as $id => $country)
                        <option value="{{ $id }}" {{ ($city->country ? $city->country->id : old('country_id')) == $id ? 'selected' : '' }}>{{ $country }}</option>
                    @endforeach
                </select>
                @if($errors->has('country'))
                    <div class="invalid-feedback">
                        {{ $errors->first('country') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.city.fields.country_helper') }}</span>
            </div>

            <div class="form-group">
                <label class="required" for="country_id">{{ trans('cruds.city.fields.state') }}</label>
                <select class="form-control select2 {{ $errors->has('country') ? 'is-invalid' : '' }}" name="state_id" id="state_id" required>
                    @foreach($states as $id => $state)
                        <option value="{{ $id }}" {{ ($city->state ? $city->state->id : old('state_id')) == $id ? 'selected' : '' }}>{{ $state }}</option>
                    @endforeach
                </select>
                @if($errors->has('state'))
                    <div class="invalid-feedback">
                        {{ $errors->first('state') }}
                    </div>
                @endif
                <span class="help-block">{{ trans('cruds.city.fields.state_helper') }}</span>
            </div>

            <!-- <div class="form-group">
                <label class="required" for="state_id">{{ trans('cruds.city.fields.state') }}</label>
                
                <select class="form-control select2 {{ $errors->has('state') ? 'is-invalid' : '' }}" name="state_id" id="state_id" required>

                    <option>Please select</option>
                </select>
                @if($errors->has('state'))
                <div class="invalid-feedback">
                    {{ $errors->first('state') }}
                </div>
                @endif
                <span class="help-block">{{ trans('cruds.city.fields.state_helper') }}</span>
            </div> -->

            <div class="form-group">
                <button class="btn btn-danger" type="submit">
                    {{ trans('global.save') }}
                </button>
            </div>
        </form>
    </div>
</div>



@endsection

@section('scripts')
@parent
<script>
    $(document).ready(function() {
        $('select[name="country_id"]').on('change', function() {
            var countryID = $(this).val();
            var url = '{{ route("admin.cities.getStates", "") }}';
            url = url+'/'+countryID;

            if (countryID) {
                $.ajax({
                    url: url,
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        $('select[name="state_id"]').empty();
                        $.each(data, function(key, value) {
                            $('select[name="state_id"]').append('<option value="' + key + '">' + value + '</option>');
                        });
                    }
                });
            } else {
                $('select[name="state_id"]').empty();
            }
        });
    });
</script>
@endsection